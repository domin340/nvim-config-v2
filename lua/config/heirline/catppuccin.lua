-- heirline configuration for Catppuccin colorscheme
local lib = require 'lib'
local utils = require 'heirline.utils'
local upper_rtriangle, upper_ltriangle = '', ''

local function setup_colors()
	local hl_statusline = utils.get_highlight 'StatusLine'

	local colors = {
		text_statusline = hl_statusline.fg,
		bg_statusline = hl_statusline.bg,
	}

	return colors
end

local Perms = require 'components.perms'

local statusline = {
	hl = { bg = 'bg_statusline' },
	Perms,
	{ provider = '%=' },
}

return {
	setup_colors = setup_colors,
	config = {
		statusline = statusline,
	},
}
