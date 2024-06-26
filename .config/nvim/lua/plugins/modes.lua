return {
	"mvllow/modes.nvim",
	tag = "v0.2.0",
	config = function()
		local palette = require("catppuccin.palettes").get_palette("frappe")
		require("modes").setup({
			colors = {
				copy = palette.yellow,
				delete = palette.red,
				insert = palette.green,
				visual = palette.mauve,
			},

			-- Set opacity for cursorline and number background
			line_opacity = 0.15,

			-- Enable cursor highlights
			set_cursor = true,

			-- Enable cursorline initially, and disable cursorline for inactive windows
			-- or ignored filetypes
			set_cursorline = true,

			-- Enable line number highlights to match cursorline
			set_number = true,

			-- Disable modes highlights in specified filetypes
			-- Please PR commonly ignored filetypes
			ignore_filetypes = { "NvimTree", "TelescopePrompt" },
		})
	end,
}
