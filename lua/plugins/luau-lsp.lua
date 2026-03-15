return {
	'lopi-py/luau-lsp.nvim',
	config = function()
		local lib = require 'lib'

		require('luau-lsp').setup {
			platform = {
				type = lib.fn.rojo_project() and 'roblox' or 'standard',
			},
			plugin = {
				enabled = true,
			},
		}
	end,
}
