local Plug = vim.fn['plug#']

vim.call('plug#begin')
	Plug 'dense-analysis/ale'	-- linter
	Plug 'nvim-tree/nvim-tree.lua'	-- file explorer
					-- change tab: ctrl + ww
	Plug 'tpope/vim-fugitive'	-- :G <git command>
	Plug 'airblade/vim-gitgutter'	-- git diff, etc
	Plug 'frazrepo/vim-rainbow'	-- colorize brackets

	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'

	-- LSP Support
	Plug 'neovim/nvim-lspconfig'
	-- Autocompletion
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'rafamadriz/friendly-snippets'

	Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v3.x'})

	Plug 'preservim/tagbar'

	Plug('nvim-treesitter/nvim-treesitter', {
		['do'] = function()
			vim.cmd(':TSUpdate')
		end
	})
	Plug 'joshdick/onedark.vim'

	Plug 'mateuszwieloch/automkdir.nvim'	-- create intermediate folder

	Plug 'nvimdev/dashboard-nvim'
	Plug 'nvim-tree/nvim-web-devicons'

	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	Plug 'numToStr/Comment.nvim'

	Plug 'lukas-reineke/indent-blankline.nvim'

	Plug 'windwp/nvim-autopairs'
	
	Plug 'f-person/git-blame.nvim'

vim.call('plug#end')
