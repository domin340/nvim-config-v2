--[[
script consisting of many helper functions
]]

local M = {}

---sorts given table by how close it is to the currently opened buffer
---@param tbl string[] table of absolute paths
function M.sort_by_buf(tbl)
	-- get current file directory (normalized)
	local bufnr = vim.api.nvim_get_current_buf()
	local bufdir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))

	---@param path string
	---@return number
	local function dist(path)
		local start = path:find(bufdir, 1, true)
		return start or math.huge
	end

	table.sort(tbl, function(a, b)
		return dist(a) < dist(b)
	end)
end

---@param name string
function M.get_mason_package(name)
	local data = vim.fn.stdpath 'data'
	return vim.fs.joinpath(data, 'mason', 'packages', name)
end

return M
