-- file contains enhancements for text like comments, pairs etc.
return {
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true,
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			toggler = {
				line = '<leader>//',
				block = '<leader>/*',
			},
			opleader = {
				line = '<leader>//',
				block = '<leader>/*',
			},
			mappings = {
				extra = false,
			},
		},
	},
	{
		'kylechui/nvim-surround',
		version = '^3.0.0',
		event = 'VeryLazy',
		opts = {},
	},
	--[[ {
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufReadPre',
		opts = {
			indent = { highlight = nil, char = '|' },
			whitespace = {
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
		},
		config = function(_, opts)
			require('ibl').setup(opts)
		end,
	}, ]]
}
