return {
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{
		'erl-koenig/theme-hub.nvim',
		lazy = false,
		priority = 500,
		dependencies = { 'nvim-lua/plenary.nvim', 'rktjmp/lush.nvim' },
		opts = { persistent = true },
	},
}
