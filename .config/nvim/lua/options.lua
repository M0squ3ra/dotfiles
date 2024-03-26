vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.updatetime = 100
vim.o.signcolumn="auto"
vim.cmd([[
	set noswapfile
	syntax on
	filetype on
	filetype plugin on
	filetype indent on

	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	autocmd BufReadPost,FileReadPost * normal zR
]])
vim.g.rainbow_active = 1
