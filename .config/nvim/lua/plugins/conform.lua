return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "google-java-format" },
				yaml = { "yamlfmt" },
				json = { "jq" },
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cf",
			'<cmd>lua require("conform").format()<CR>',
			{ noremap = true, silent = true }
		)
	end,
}