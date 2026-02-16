local capabilities = require('blink.cmp').get_lsp_capabilities()

if vim.lsp.config then
	local function on_attach(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			require('nvim-navic').attach(client, bufnr)
		end
	end

	vim.lsp.config('*', {
		capabilities = capabilities,
		on_attach = on_attach,
	})
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
