--[[
script consisting of many helper functions
]]

local M = {}

---@param x number
---@param digits integer? default 0
function M.round_number(x, digits)
	digits = digits or 0

	local int = math.floor(x)
	local rem = (x - int)

	if rem == 0 or digits == 0 then
		return int
	end

	local factor = 10 ^ digits

	local truncated
	if x >= 0 then
		truncated = math.floor(rem * factor) / factor
	else
		truncated = math.ceil(rem * factor) / factor
	end

	return int + truncated
end

function M.rojo_project()
	return vim.fs.root(0, function(name)
		return name:match '.+%.project%.json$'
	end)
end

---@param name string
function M.hl(name)
	return vim.api.nvim_get_hl(0, { name = name })
end

---@param name string
function M.bg(name)
	return string.format('#%06x', M.hl(name).bg)
end

---@param name string
function M.fg(name)
	return string.format('#%06x', M.hl(name).fg)
end

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
