---@class components.perms
---@field file_abspath string
---@field perm_string string
local Perms = {
	update = { 'BufEnter', 'BufLeave' },

	---@param self components.perms
	init = function(self)
		self.file_abspath = vim.fn.expand '%:p'
		self.perm_string = vim.fn.getfperm(self.file_abspath)
	end,

	---@param self components.perms
	provider = function(self)
		if self.perm_string ~= '' then
			local user_group = string.sub(self.perm_string, 1, 3)
			return string.upper(user_group)
		else
			return '---'
		end
	end,
}

return Perms
