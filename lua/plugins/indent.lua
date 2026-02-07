return {
	'nmac427/guess-indent.nvim',
	opts = {},
	config = function(_, opts)
		require('guess-indent').setup(opts)
		vim.keymap.set('n', '<leader>ii', '<CMD>GuessIndent<CR>', { desc = 'guess-indent.nvim' })
	end,
}
