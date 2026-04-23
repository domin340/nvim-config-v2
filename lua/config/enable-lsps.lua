local blink_capabilities = require('blink.cmp').get_lsp_capabilities()
local lib = require 'lib'

if vim.lsp.config then
	local file_watcher_capabilities = {
		capabilities = {
			workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			},
		},
	}

	local capabilities = vim.tbl_deep_extend('force', file_watcher_capabilities, blink_capabilities)

	vim.lsp.config('*', { capabilities = capabilities })
end

local function lua_ls_settings()
	local globals = { 'vim' }
	local workspace_libraries = {
		vim.env.VIMRUNTIME,
	}

	local lua_settings = {
		runtime = { version = 'LuaJIT' },
		diagnostics = { globals = globals },
		workspace = {
			library = workspace_libraries,
			checkThirdParty = false,
		},
		telemetry = { enable = false },
	}

	return {
		settings = { Lua = lua_settings },
	}
end

if lib.fn.rojo_project() then
	---@param path string
	---@return "lua" | "luau"
	local function luau_ext(path)
		return path:match '%.nvim%.lua$' and 'lua' or 'luau'
	end

	vim.filetype.add {
		extension = { lua = luau_ext },
	}
else
	vim.lsp.config('lua_ls', lua_ls_settings())
end

vim.lsp.enable {
	'ts_ls',
	'lua_ls',
	'zls',
	'clangd',
	'pyright',
}
