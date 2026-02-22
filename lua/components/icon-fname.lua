local webdevicons = require 'nvim-web-devicons'

---@class components.icon-fname
---@field fname string
---@field icon string
local c = {
	update = { 'BufEnter', 'BufLeave' },

	---@param self components.icon-fname
	init = function(self)
		local fname = vim.fs.basename(vim.fn.expand '%')
		if not fname or fname == '' then
			self.fname = vim.fs.basename(vim.fn.getcwd()) or '???'
			self.icon = ''
		else
			self.fname = fname
			self.icon = webdevicons.get_icon(self.fname, nil, { default = true })
		end
	end,

	---@param self components.icon-fname
	provider = function(self)
		return self.icon .. ' ' .. self.fname
	end,
}

return c
