return {
	"j-hui/fidget.nvim", -- UI for Neovim notifications and LSP progress messages
	config = function()
		require("fidget").setup({
			notification = {
				window = {
					winblend = 0,
				},
			},
			progress = {
				display = {
					render_limit = 14,
				},
			},
		})
	end,
}
