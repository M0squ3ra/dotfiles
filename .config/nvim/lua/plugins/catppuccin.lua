return {
	"catppuccin/nvim", -- theme
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "frappe", -- latte, frappe, macchiato, mocha
			color_overrides = {},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = false,
					indentscope_color = "",
				},
				mason = true,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

