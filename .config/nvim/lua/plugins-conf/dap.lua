-- DAP
opts = {
	controls = {
		element = "repl",
		enabled = false,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = ""
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
        	expanded = ""
	},
	layouts = {
		{
			elements = {
        			{
					id = "scopes",
			        	size = 0.50
				},
				{
					id = "stacks",
        				size = 0.30
        				},
        			{
        				id = "watches",
        				size = 0.10
        			},
        			{
        				id = "breakpoints",
        				size = 0.10
        			}
        		},
			size = 30,
        		position = "left", -- Can be "left" or "right"
		},
		{
        		elements = {
        			"repl",
        			"console",
        		},
        		size = 10,
        		position = "bottom", -- Can be "bottom" or "top"
		}
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
}
local dap = require('dap')
require('dap-go').setup()
local dapui = require('dapui')
dapui.setup(opts)
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
-- Commented to prevent DAP UI from closing when unit tests finish
	-- dapui.close()
end
dap.listeners.after.event_exited["dapui_config"] = function()
-- Commented to prevent DAP UI from closing when unit tests finish
	dapui.close()
end
