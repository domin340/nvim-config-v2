return {
	'stevearc/conform.nvim',
	opts = {
		format_on_save = {
			async = false,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			-- <lua>
			lua = { 'stylua' },
			luau = { 'stylua' },
			-- </lua>

			-- <other>
			python = { 'black' },
			c = { 'clang-format' },
			cpp = { 'clang-format' },
			-- </other>

			-- <web stuff>
			javascript = { 'prettierd', 'prettier' },
			typescript = { 'prettierd', 'prettier' },
			javascriptreact = { 'prettierd', 'prettier' },
			typescriptreact = { 'prettierd', 'prettier' },
			-- </web stuff>
		},
		formatters = {
			isort = {
				prepend_args = { '--profile', 'black' },
			},
			odinfmt = {
				command = 'odinfmt',
				args = { '-stdin' },
				stdin = true,
			},
		},
	},
	config = function(_, opts)
		require('conform').setup(opts)

		-- fd, short for: format document
		vim.keymap.set('n', '<leader>fd', function()
			require('conform').format { async = true }
		end, { desc = 'Formats current buffer' })
	end,
}
