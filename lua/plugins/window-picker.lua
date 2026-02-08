return {
	's1n7ax/nvim-window-picker',
	name = 'window-picker',
	event = 'VeryLazy',
	version = '2.*',
	opts = {
		hint = 'floating-big-letter',
	},
	config = function(_, opts)
		local picker = require 'window-picker'
		picker.setup(opts)

		-- TODO: implement - "window swap" methods
		local function pick_selected_window()
			local win_id = picker.pick_window()
			vim.api.nvim_set_current_win(win_id)
		end

		vim.keymap.set('n', '<leader>wp', pick_selected_window, { desc = 'Pick window' })
	end,
}
