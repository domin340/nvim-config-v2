---@class components.mode
---@field map { [string]: string } used to expand m name
---@field m string
local Mode = {
	static = {
		map = {
			['n'] = 'NORMAL',
			['no'] = 'NORMAL',
			['nov'] = 'NORMAL',
			['noV'] = 'NORMAL',
			['no\022'] = 'NORMAL',
			['niI'] = 'NORMAL',
			['niR'] = 'NORMAL',
			['niV'] = 'NORMAL',
			['nt'] = 'NORMAL',
			['ntT'] = 'NORMAL',
			['v'] = 'VISUAL',
			['vs'] = 'VISUAL',
			['V'] = 'VLINE',
			['Vs'] = 'VLINE',
			['\022'] = 'VBLOCK',
			['\022s'] = 'VBLOCK',
			['s'] = 'SELECT',
			['S'] = 'SELECT',
			['\019'] = 'SELECT',
			['i'] = 'INSERT',
			['ic'] = 'INSERT',
			['ix'] = 'INSERT',
			['R'] = 'REPLACE',
			['Rc'] = 'REPLACE',
			['Rx'] = 'REPLACE',
			['Rv'] = 'VREPL',
			['Rvc'] = 'VREPL',
			['Rvx'] = 'VREPL',
			['c'] = 'COMMAND',
			['cr'] = 'COMMAND',
			['cv'] = 'COMMAND',
			['cvr'] = 'COMMAND',
			['r'] = 'PROMPT',
			['rm'] = 'PROMPT',
			['r?'] = 'YES?',
			['!'] = 'SHELL',
			['t'] = 'TERMINAL',
		},
	},

	---@param self components.mode
	init = function(self)
		self.m = vim.fn.mode()
	end,

	---@param self components.mode
	provider = function(self)
		return self.map[self.m]
	end,
}

return Mode
