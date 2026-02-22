return {
	provider = function()
		local cur_line = vim.fn.getpos('.')[2]
		local last_line = vim.fn.getpos('$')[2]

		local percentage = math.floor((cur_line / last_line) * 100)

		return percentage .. '%%'
	end,
}
