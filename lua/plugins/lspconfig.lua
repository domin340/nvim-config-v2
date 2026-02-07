return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'mason-org/mason.nvim',
		'nvim-telescope/telescope.nvim',
		'saghen/blink.cmp',
	},
	config = function()
		---@param show_all boolean
		---@return fun(): nil
		local function get_diagnostics(show_all)
			local bufnr = show_all and nil or 0
			return function()
				require('telescope.builtin').diagnostics { bufnr = bufnr }
			end
		end

		local function on_attach(args)
			---@generic T
			---@param tbl T | { buffer: any }
			---@return T & { buffer: number }
			local function opts(tbl)
				tbl.buffer = args.buf
				return tbl
			end

			local buf = vim.lsp.buf

			vim.keymap.set('n', 'gd', buf.definition, opts { desc = 'LSP go to definition' })
			vim.keymap.set('n', 'gD', buf.declaration, opts { desc = 'LSP go to declaration' })
			vim.keymap.set('n', 'gt', buf.type_definition, opts { desc = 'LSP go to type definition' })
			vim.keymap.set('n', 'gh', buf.hover, opts { desc = 'LSP hover' })
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP opens code actions' })

			vim.keymap.set('n', '<C-j>', function()
				vim.lsp.util.scroll(4)
			end, opts { desc = 'LSP scroll hover down' })

			vim.keymap.set('n', '<C-k>', function()
				vim.lsp.util.scroll(-4)
			end, opts { desc = 'LSP scroll hover up' })

			vim.keymap.set(
				'n',
				'<leader>h',
				vim.diagnostic.open_float,
				opts { desc = 'LSP diagnostics floating report' }
			)
			vim.keymap.set('n', '<leader>d', get_diagnostics(false), opts { desc = 'LSP View buffer reports' })
			vim.keymap.set('n', '<leader>D', get_diagnostics(true), opts { desc = 'LSP View workspace reports' })
		end

		vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

		vim.diagnostic.config {
			virtual_text = true,
			signs = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		}

		require 'config.enable_lsps'
	end,
}
