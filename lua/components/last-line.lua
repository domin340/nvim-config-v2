return {
	provider = function()
		return tostring(vim.fn.getpos('$')[2])
	end,
}
