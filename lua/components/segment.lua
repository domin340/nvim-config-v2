---@class components.segment
---@field children table
---@field no_sep boolean?

local default_sep = { provider = '│' }
local sep = default_sep

---@param new_sep string | table | nil
local function set_sep(new_sep)
	if type(new_sep) == 'string' then
		sep = { provider = new_sep }
	elseif type(new_sep) == 'table' then
		sep = new_sep
	else
		sep = default_sep
	end
end

---@overload fun(components: table[]): table
---@overload fun(components: components.segment): table
---@param components table[] | components.segment
local function Segment(components)
	if components.children then
		local segment = { components.children }

		if not components.no_sep then
			table.insert(segment, sep)
		end

		return segment
	end

	return {
		components,
		sep,
	}
end

return {
	set_sep = set_sep,
	Segment = Segment,
}
