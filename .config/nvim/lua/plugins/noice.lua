return -- lazy.nvim
{
	"folke/noice.nvim", --replaces the UI for messages, cmdline and the popupmenu
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{ "rcarriga/nvim-notify", enabled = false },
		"nvim-treesitter/nvim-treesitter/",
	},
	config = function()
		require("noice").setup({
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			messages = {
				enabled = false,
			},
			lsp = {
				progress = { enabled = false },
				hover = { enabled = false },
				signature = { enabled = false },
				message = { enabled = false },
			},
		})
	end,
}
