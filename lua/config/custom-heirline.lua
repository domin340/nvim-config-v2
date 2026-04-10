-- local utils = require 'heirline.utils'

local function setup_colors()
	-- ---@param name string
	-- local function bg(name)
	-- 	return utils.get_highlight(name).bg
	-- end
	--
	-- ---@param name string
	-- local function fg(name)
	-- 	return utils.get_highlight(name).fg
	-- end

	return {
		-- fn = fg 'Function',
		-- kw = fg 'Keyword',
		-- text = fg 'StatusLine',
		-- bg = bg 'StatusLine',
		-- str = fg 'String',
	}
end

local Space = require 'components.space'
local End = { provider = '%=' }

local segment_lib = require 'components.segment'

local Segment = segment_lib.Segment
local IconFname = require 'components.icon-fname'
local Modified = require 'components.modified'
local Perms = require 'components.perms'
local FileSize = require 'components.file-size'
local Head = require 'components.git-head'
local LastLine = require 'components.last-line'
local ReadOfPage = require 'components.read-of-page'
local Mode = require 'components.mode'

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
		Space,
		FileSize,
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
					return { bold = true }
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
