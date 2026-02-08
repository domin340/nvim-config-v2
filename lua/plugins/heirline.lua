return {
	'rebelot/heirline.nvim',
	dependencies = {
		-- other plugins used for configuring lines and bars with heirline.nvim
		'SmiteshP/nvim-navic',
		'lewis6991/gitsigns.nvim',
	},
	config = function()
		require('heirline').setup {}
	end,
}
