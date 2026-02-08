return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
	},
	config = function()
		local dap = require 'dap'

		local dapui = require 'dapui'
		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set('n', '<leader>ot', dap.toggle_breakpoint, { desc = 'DAP toggles break point in this line' })
		vim.keymap.set('n', '<leader>oc', dap.continue, { desc = 'DAP start debugging / go next break point ' })

		-- configurations
		require 'config.debuggers'
	end,
}
