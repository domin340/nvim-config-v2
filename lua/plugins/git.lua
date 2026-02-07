return {
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			---@param bufnr integer
			local function on_attach(bufnr)
				local gitsigns = require 'gitsigns'

				---@param tbl table?
				local function opts(tbl)
					tbl = tbl or {}
					tbl.buffer = bufnr
					return tbl
				end

				vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff, opts { desc = 'gitsigns word diff' })
				vim.keymap.set('n', 'hi', gitsigns.preview_hunk_inline, opts { desc = 'gitsigns hunk inline' })
				vim.keymap.set(
					'n',
					'<leader>tb',
					gitsigns.toggle_current_line_blame,
					opts { desc = 'gitsigns line blame' }
				)
			end

			require('gitsigns').setup {
				on_attach = on_attach,
			}
		end,
	},
}
