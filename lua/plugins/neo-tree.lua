return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	lazy = false,
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_ignored = false,
			},
		},
	},
	config = function(_, opts)
		require('neo-tree').setup(opts)

		vim.keymap.set('n', '-', '<CMD>Neotree filesystem toggle right<CR>', { desc = 'Neotree Toggle' })
		vim.keymap.set('n', '<leader>ee', '<CMD>Neotree filesystem reveal right<CR>', { desc = 'Neotree reveal' })
		vim.keymap.set('n', '<leader>ec', '<CMD>Neotree close<CR>', { desc = 'Neotree Close' })
	end,
}
