return {
	"akinsho/toggleterm.nvim", -- Terminal emulator
	config = function()
		require("toggleterm").setup({
			float_opts = {
				border = "curved",
			},
		})

		vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true })
		vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=tab<CR>", { noremap = true })
	end,
}
