local lib = require 'lib'
local round_number = lib.fn.round_number

---@class components.file-size
---@field sizes { [number]: string }
---@field buf_size number
local FileSize = {
	static = {
		sizes = {
			'b',
			'kb',
			'mb',
			'gb',
			'tb',
			'pb',
			'eb',
			'zb',
			'yb',
		},
	},

	---@param self components.file-size
	init = function(self)
		self.buf_size = vim.fn.wordcount().bytes or 0
	end,

	---@param self components.file-size
	provider = function(self)
		local rem, n = self.buf_size, 1
		while rem >= 1024 do
			rem = rem / 1024
			n = n + 1
		end

		local unit = self.sizes[n]
		if not unit then
			return '??'
		end

		local rem_rounded = round_number(rem, 2)

		return rem_rounded .. unit
	end,
}

return FileSize
