local utils = require 'heirline.utils'
local Space = require 'components.space'

local function setup_colors()
	---@param name string
	local function bg(name)
		return utils.get_highlight(name).bg
	end

	---@param name string
	local function fg(name)
		return utils.get_highlight(name).fg
	end

	return {
		fn = fg 'Function',
		kw = fg 'Keyword',
		text = fg 'StatusLine',
		bg = bg 'StatusLine',
		str = fg 'String',
	}
end

local IconFname = require 'components.icon-fname'
local Modified = require 'components.modified'
local Perms = require 'components.perms'
local Head = require 'components.git-head'

local End = { provider = '%=' }
local LastLine = require 'components.last-line'
local ReadOfPage = require 'components.read-of-page'
local Mode = require 'components.mode'

local sloop = { provider = '│', hl = { fg = 'text' } }

local statusline = {
	Space,
	IconFname,
	Space,
	{
		hl = { fg = 'str' },
		Modified,
	},
	sloop,

	Space,
	Perms,
	Space,

	sloop,

	Space,
	Head,

	End,

	Space,
	{
		hl = { fg = 'fn' },
		LastLine,
	},
	Space,
	{
		provider = '↓',
		ReadOfPage,
	},
	Space,

	sloop,
	{
		hl = function()
			if vim.fn.reg_recording() ~= '' then
				return { fg = 'kw', bold = true }
			end

			return nil
		end,

		Space,
		Mode,
		Space,
	},
}

return {
	setup_colors = setup_colors,
	statusline = statusline,
}
