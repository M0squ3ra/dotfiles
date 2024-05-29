return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup()
		vim.keymap.set("n", "ft", ":TodoTelescope keywords=TODO,FIX<CR>", { noremap = true, silent = true })
	end,
}
