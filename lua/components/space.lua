local Space = { provider = ' ' }

Space = setmetatable(Space, {
	__mul = function(self, second)
		if type(second) == 'number' then
			return { provider = self.provider:rep(second) }
		else
			error('unexpected type: ' .. type(second) .. ' to perform mul operation')
		end
	end,
})

return Space
