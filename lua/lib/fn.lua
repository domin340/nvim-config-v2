--[[
script consisting of many helper functions
]]

local M = {}

---@param name string
function M.get_mason_package(name)
	local data = vim.fn.stdpath 'data'
	return vim.fs.joinpath(data, 'mason', 'packages', name)
end

return M
