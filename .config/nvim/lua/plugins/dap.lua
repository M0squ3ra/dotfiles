return {
	"mfussenegger/nvim-dap", -- Debug Adapter Protocol implementation
	dependencies = {
		"rcarriga/cmp-dap", -- autocompletion for nvim-dap
		"leoluz/nvim-dap-go", -- Go extension for delve (debugger)
		"nvim-neotest/nvim-nio", -- asynchronous IO in Neovim
		"rcarriga/nvim-dap-ui", -- A UI for nvim-dap
	},
	config = function()
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
					terminate = "",
				},
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.50,
						},
						{
							id = "stacks",
							size = 0.30,
						},
						{
							id = "watches",
							size = 0.10,
						},
						{
							id = "breakpoints",
							size = 0.10,
						},
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
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		}
		local dap = require("dap")
		require("dap-go").setup()
		local dapui = require("dapui")
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

		function attach_to_debug()
			dap.configurations.java = {
				{
					type = "java",
					request = "attach",
					name = "Attach to the process",
					hostName = "localhost",
					port = "5005",
				},
			}
			dap.continue()
		end

		vim.keymap.set("n", "<leader>da", ":lua attach_to_debug()<CR>")

		-- setup debug
		vim.keymap.set("n", "<leader>b", ':lua require"dap".toggle_breakpoint()<CR>')
		vim.keymap.set("n", "<leader>B", ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
		vim.keymap.set("n", "<leader>bl", ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
		vim.keymap.set("n", "<leader>dr", ':lua require"dap".repl.open()<CR>')
		-- move in debug
		vim.keymap.set("n", "<F5>", ':lua require"dap".continue()<CR>')
		vim.keymap.set("n", "<F7>", ':lua require"dap".step_into()<CR>')
		vim.keymap.set("n", "<F8>", ':lua require"dap".step_over()<CR>')
		vim.keymap.set("n", "<S-F8>", ':lua require"dap".step_out()<CR>')

		-- view information in debug
		function show_dap_centered_scopes()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end

		vim.keymap.set("n", "<leader>ds", ":lua show_dap_centered_scopes()<CR>")
	end,
}
