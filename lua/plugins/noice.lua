return {
	{
		'nvim-mini/mini.nvim',
		version = '*',
		opts = {},
		config = function(_, opts)
			require('mini.notify').setup(opts)
		end,
	},
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {},
		dependencies = {
			'MunifTanjim/nui.nvim',
			'nvim-mini/mini.nvim',
		},
	},
}
