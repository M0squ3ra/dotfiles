local Plug = vim.fn['plug#']

vim.call('plug#begin')
	Plug 'dense-analysis/ale'			-- linter
	Plug 'nvim-tree/nvim-tree.lua'			-- file explorer
	Plug 'tpope/vim-fugitive'			-- :G <git command>
	Plug 'lewis6991/gitsigns.nvim'			-- git diff, etc
	Plug 'frazrepo/vim-rainbow'			-- colorize brackets
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	-- LSP Support -----
	Plug 'neovim/nvim-lspconfig'
	-- Autocompletion --
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'rafamadriz/friendly-snippets'
	Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v3.x'})
	--------------------
	Plug 'preservim/tagbar'				-- browse the tags of the current file and get an overview of its structure 
	Plug('nvim-treesitter/nvim-treesitter', {
		['do'] = function()
			vim.cmd(':TSUpdate')
		end
	})
	Plug('catppuccin/nvim', {as = 'catppuccin'})	-- theme
	Plug 'mateuszwieloch/automkdir.nvim'		-- create intermediate folder
	Plug 'nvimdev/dashboard-nvim'			-- dashboard
	Plug 'nvim-tree/nvim-web-devicons'		-- icons
	Plug 'nvim-lua/plenary.nvim'			-- lua functions
	Plug 'nvim-telescope/telescope.nvim'		-- fuzzy finder
	Plug 'numToStr/Comment.nvim'			-- commenting plugin
	Plug 'lukas-reineke/indent-blankline.nvim'	-- adds indentation guides
	Plug 'windwp/nvim-autopairs'			-- autopair
	Plug 'f-person/git-blame.nvim'			-- git blame
	Plug 'akinsho/bufferline.nvim'			-- buffer line with tabpage integration
	Plug 'tzachar/local-highlight.nvim'		-- highlight uses of word under the cursor
	Plug 'tpope/vim-repeat'				-- general-purpose motion plugin
	Plug 'ggandor/leap.nvim'
	Plug 'rmagatti/goto-preview'			-- preview native LSP's goto definition
	-- Plug 'mfussenegger/nvim-lint'
	Plug 'sindrets/diffview.nvim'			-- preview all git diffs
vim.call('plug#end')



