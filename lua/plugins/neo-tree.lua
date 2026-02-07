return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	lazy = false,
	config = function()
		require('neo-tree').setup {
			sources = {
				'document_symbols',
				'buffers',
				'filesystem',
				'git_status',
			},
			filesystem = {
				follow_current_file = {
				   enabled = true,
					leave_dirs_open = false,
				},
			},
		}

		vim.keymap.set('n', '-', '<CMD>Neotree filesystem toggle right<CR>')
		vim.keymap.set('n', '<leader>ee', '<CMD>Neotree filesystem reveal right<CR>')
		vim.keymap.set('n', '<leader>ed', '<CMD>Neotree document_symbols reveal right<CR>')
		vim.keymap.set('n', '<leader>eb', '<CMD>Neotree buffers reveal right<CR>')
		vim.keymap.set('n', '<leader>eg', '<CMD>Neotree git_status reveal right<CR>')
		vim.keymap.set('n', '<leader>ec', '<CMD>Neotree close<CR>')
	end,
}
