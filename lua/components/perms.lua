---@class components.perms
---@field cur_buf_ro fun(): boolean
local Perms = {
	static = {
		cur_buf_ro = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
	},

	---@param self components.perms
	provider = function(self)
		-- when it's a normal buffer - display permissions.
		-- otherwise, print a dot.
		-- 2 characters must be printed to display displacement
		return vim.bo.buftype == '' and (self.cur_buf_ro() and 'RO' or 'RW') or '* '
	end,
}

return Perms
