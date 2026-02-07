return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',
	opts = {
		keymap = {
			preset = 'default',
		},
		appearance = {
			nerd_font_variant = 'mono',
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		fuzzy = { implementation = 'lua' },
		signature = {
			enabled = true,
			window = { show_documentation = true },
		},
	},
	opts_extend = { 'sources.default' },
}
