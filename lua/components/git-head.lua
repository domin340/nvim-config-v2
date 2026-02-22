---@class components.git-head
---@field dict { head: string? }
local Head = {
	condition = require('heirline.conditions').is_git_repo,

	---@param self components.git-head
	init = function(self)
		self.dict = vim.b.gitsigns_status_dict
	end,

	---@param self components.git-head
	provider = function(self)
		return self.dict.head or '.???'
	end,
}

return Head
