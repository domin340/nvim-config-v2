return {
	'ingur/floatty.nvim',
	config = function()
		local term = require('floatty').setup {
			window = {
				row = function()
					return vim.o.lines - 11
				end,
				width = 1.0,
				height = 8,
				title = 'terminal',
			},
		}

		vim.keymap.set('n', '<C-t>', function()
			term.toggle()
		end, { desc = 'Toggles floatty terminal' })

		vim.keymap.set('t', '<C-t>', function()
			term.toggle()
		end, { desc = 'Toggles floatty terminal' })
	end,
}
