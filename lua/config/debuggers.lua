local lib = require 'lib'

local function netcoredbg(dap)
	local mason_debugger_path = vim.fs.joinpath('netcoredbg', 'netcoredbg', 'netcoredbg')

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
				return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
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
