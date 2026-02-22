return {
	'rebelot/heirline.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		local utils = require 'heirline.utils'

		local custom_heirline = require 'config.custom-heirline'
		local setup_colors = custom_heirline.setup_colors

		-- set up colors before everything
		require('heirline').load_colors(setup_colors)
		vim.api.nvim_create_augroup('Heirline', { clear = true })
		vim.api.nvim_create_autocmd('ColorScheme', {
			callback = function()
				utils.on_colorscheme(setup_colors)
			end,
			group = 'Heirline',
		})

		require('heirline').setup {
			statusline = custom_heirline.statusline,
		}
	end,
}
