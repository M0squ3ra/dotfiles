return {
	"sindrets/diffview.nvim", -- preview all git diffs
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { noremap = true, silent = true })
	end,
}
