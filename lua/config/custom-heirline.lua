local utils = require 'heirline.utils'
local Space = require 'components.space'

local function mix(c1, c2, weight)
	-- 1. Extract RGB from c1
	local r1 = math.floor(c1 / 65536) % 256
	local g1 = math.floor(c1 / 256) % 256
	local b1 = c1 % 256

	-- 2. Extract RGB from c2
	local r2 = math.floor(c2 / 65536) % 256
	local g2 = math.floor(c2 / 256) % 256
	local b2 = c2 % 256

	-- 3. Mix (Linear Interpolation)
	local r = r1 * (1 - weight) + r2 * weight
	local g = g1 * (1 - weight) + g2 * weight
	local b = b1 * (1 - weight) + b2 * weight

	-- 4. Format as hex string
	return string.format('#%02x%02x%02x', math.floor(r), math.floor(g), math.floor(b))
end

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
		-- darker_kw = mix(fg 'Keyword', bg 'StatusLine', 0.5),
		text = fg 'StatusLine',
		bg = bg 'StatusLine',
		s1 = mix(bg 'StatusLine', 0x00, 0.4),
		s2 = mix(bg 'StatusLine', 0x00, 0.2),
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

local sloop = { provider = '⎹', hl = { fg = 'text' } }

local Section_1 = {
	hl = { bg = 's1' },

	Space,
	IconFname,
	Space,
	{
		hl = { fg = 'str' },
		Modified,
		{
			condition = function()
				return not vim.bo.modified
			end,

			Space,
		},
	},

	sloop,
}

local Section_2 = {
	hl = { bg = 's2' },

	Space,
	Perms,
	Space,
	sloop,
}

local Section_3 = {
	Space,
	Head,
}

local statusline = {
	hl = { fg = 'text', bg = 'bg' },

	Section_1,
	Section_2,
	Section_3,

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
