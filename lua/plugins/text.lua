-- file contains enhancements for text like comments, pairs etc.
return {
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true,
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			toggler = {
				line = '<leader>//',
				block = '<leader>/*',
			},
			opleader = {
				line = '<leader>//',
				block = '<leader>/*',
			},
			mappings = {
				extra = false,
			},
		},
	},
	{
		'mcauley-penney/visual-whitespace.nvim',
		event = 'ModeChanged *:[vV\22]',
		opts = {
			list_chars = {
				tab = '⇾',
			},
			fileformat_chars = {
				unix = ' ␊',
				mac = ' ␊',
				dos = ' ␤',
			},
		},
	},
	{
		'kylechui/nvim-surround',
		version = '^3.0.0',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'nmac427/guess-indent.nvim',
		opts = {},
		config = function(_, opts)
			require('guess-indent').setup(opts)
			if true then
				print 'first statement evaluated to true'
			elseif true then
				print 'something is being done'
			end
			vim.keymap.set('n', '<leader>ii', '<CMD>GuessIndent<CR>', { desc = 'guess-indent.nvim' })
		end,
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufReadPre',
		opts = {
			indent = { highlight = nil, char = '⁝' },
			whitespace = {
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
		},
		config = function(_, opts)
			require('ibl').setup(opts)
		end,
	},
	{
		-- works with indentation and numbers.
		-- makes it overall easier to spot where something ends on a 'formatted' document.
		'mawkler/hml.nvim',
		config = function(self)
			require('hml').setup()
		end,
	},
}
