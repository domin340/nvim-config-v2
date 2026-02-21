return {
	'rebelot/heirline.nvim',
	dependencies = {
		-- other plugins used for configuring lines and bars with heirline.nvim
		'SmiteshP/nvim-navic',
		'lewis6991/gitsigns.nvim',
	},
	config = function()
		local utils = require 'heirline.utils'
		local catppuccin = require 'config.heirline.catppuccin'

		local chosen = catppuccin
		require('heirline').load_colors(chosen.setup_colors)

		vim.api.nvim_create_augroup('Heirline', { clear = true })
		vim.api.nvim_create_autocmd('ColorScheme', {
			callback = function()
				utils.on_colorscheme(chosen.setup_colors)
			end,
			group = 'Heirline',
		})

		require('heirline').setup(chosen.config)
	end,
}
