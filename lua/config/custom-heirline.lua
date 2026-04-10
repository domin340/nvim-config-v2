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

---@class custom-heirline-components-segment
---@field children table
---@field no_sep boolean?

---@overload fun(components: table[]): table
---@overload fun(components: custom-heirline-components-segment): table
---@param components table[] | custom-heirline-components-segment
local function Segment(components)
	if components.children then
		local segment = { components.children }

		if not components.no_sep then
			table.insert(segment, sloop)
		end

		return segment
	end

	return {
		components,
		sloop,
	}
end

local statusline = {
	Segment {
		Space,
		IconFname,
		Space,
		Modified,
	},

	Segment {
		Space,
		Perms,
		Space,
	},

	Segment {
		no_sep = true,
		children = {
			Space,
			Head,
		},
	},

	End,

	Segment {
		Space,
		LastLine,
		Space,
		{
			provider = '↓',
			ReadOfPage,
		},
		Space,
	},

	Segment {
		no_sep = true,
		children = {
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
	},
}

return {
	setup_colors = setup_colors,
	statusline = statusline,
}
