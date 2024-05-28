return {
	"preservim/tagbar", -- browse the tags of the current file and get an overview of its structure
	config = function()
		vim.keymap.set("n", "<F11>", ":TagbarToggle<CR>", { noremap = true, silent = true })
	end,
}

