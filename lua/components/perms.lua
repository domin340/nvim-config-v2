---@class components.perms
---@field str string
local Perms = {
	---@param self components.perms
	init = function(self)
		self.str = vim.fn.getfperm(vim.fn.expand '%')
	end,

	---@param self components.perms
	provider = function(self)
		if self.str ~= '' then
			local user_group = self.str:sub(1, 3)
			return user_group:gsub('-', '_'):upper()
		else
			return 'R_'
		end
	end,
}

return Perms
