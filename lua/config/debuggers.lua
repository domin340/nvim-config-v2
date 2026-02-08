local lib = require 'lib'

local function netcoredbg(dap)
	local mason_debugger_path = vim.fs.joinpath('netcoredbg', 'netcoredbg', 'netcoredbg')

	local function get_dlls()
		local scan = require 'plenary.scandir'

		---@type string[]
		local dlls = scan.scan_dir('.', { search_pattern = '%.dll' })

		---@type string[]
		local filtered_dlls = {}

		---@param filepath string
		for _, filepath in ipairs(dlls) do
			local absfilepath = vim.fs.abspath(filepath)
			absfilepath = vim.fs.normalize(absfilepath)

			if absfilepath:match 'bin/Debug/[^/]+/' then
				table.insert(filtered_dlls, absfilepath)
			end
		end

		return filtered_dlls
	end

	---returns chosen option (string), index of that option (integer) and found dlls inside project
	local function input_debug_program()
		local dlls = get_dlls()
		lib.fn.sort_by_buf(dlls)

		local in_options = {
			' Choose program to debug:',
		}

		-- make the paths relative again to the current working directory
		local cwd = vim.fn.getcwd()
		local display_tbl = vim.tbl_map(function(path)
			return vim.fs.relpath(cwd, path)
		end, dlls)

		for i, dll in ipairs(display_tbl) do
			local option_text = string.format('%d. %s', i, dll)
			table.insert(in_options, option_text)
		end

		-- to avoid glitching telescope-ui
		table.insert(in_options, '')

		---@type integer
		local index = vim.fn.inputlist(in_options)

		local is_in_bounds = index <= #dlls and index >= 1
		assert(index ~= nil and is_in_bounds, 'please select a program from the list')

		return dlls[index], index, dlls
	end

	dap.adapters.coreclr = {
		type = 'executable',
		command = lib.fn.get_mason_package(mason_debugger_path),
		args = { '--interpreter=vscode' },
	}

	dap.configurations.cs = {
		{
			type = 'coreclr',
			name = 'launch - netcoredbg',
			request = 'launch',
			program = function()
				return input_debug_program()
			end,
		},
	}
end

local function codelldb(dap)
	dap.adapters.gdb = {
		type = 'executable',
		command = 'gdb',
		args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
	}

	dap.configurations.c = {
		{
			name = 'Launch',
			type = 'gdb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			args = {}, -- provide arguments if needed
			cwd = '${workspaceFolder}',
			stopAtBeginningOfMainSubprogram = false,
		},
		{
			name = 'Select and attach to process',
			type = 'gdb',
			request = 'attach',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			pid = function()
				local name = vim.fn.input 'Executable name (filter): '
				return require('dap.utils').pick_process { filter = name }
			end,
			cwd = '${workspaceFolder}',
		},
		{
			name = 'Attach to gdbserver :1234',
			type = 'gdb',
			request = 'attach',
			target = 'localhost:1234',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
		},
	}

	dap.configurations.cpp = dap.configurations.c
	dap.configurations.rust = dap.configurations.c
end

local dap = require 'dap'
netcoredbg(dap)
codelldb(dap)
