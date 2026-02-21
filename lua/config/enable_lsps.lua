local capabilities = require('blink.cmp').get_lsp_capabilities()

if vim.lsp.config then
	vim.lsp.config('*', { capabilities = capabilities })
end

local function lua_ls_settings()
	local globals = { 'vim' }
	local workspace_libraries = {
		vim.env.VIMRUNTIME,
	}

	return {
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				diagnostics = { globals = globals },
				workspace = {
					library = workspace_libraries,
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	}
end

vim.lsp.config('lua_ls', lua_ls_settings())

vim.lsp.enable {
	'clangd',
	'ts_ls',
	'pyright',
	'lua_ls',
}
