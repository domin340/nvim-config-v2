return {
	'josephschmitt/pj.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
	},
	cmd = { 'Pj', 'PjCd' },
	keys = {
		{ '<leader>fp', '<cmd>Pj<cr>', desc = 'Find Projects' },
	},
	opts = {
		picker = { type = 'telescope' },
	},
}
