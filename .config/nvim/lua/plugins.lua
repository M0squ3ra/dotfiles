local Plug = vim.fn['plug#']

vim.call('plug#begin')
	Plug 'dense-analysis/ale'			-- linter
	Plug 'nvim-tree/nvim-tree.lua'			-- file explorer
	Plug 'tpope/vim-fugitive'			-- :G <git command>
	Plug 'lewis6991/gitsigns.nvim'			-- git diff, etc
	Plug 'frazrepo/vim-rainbow'			-- colorize brackets
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'-- Autoinstall plugins and tools
	-- LSP Support -----
	Plug 'neovim/nvim-lspconfig'
	-- Autocompletion --
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'rafamadriz/friendly-snippets'
	Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v3.x'})
	Plug 'onsails/lspkind.nvim'
	Plug 'rcarriga/cmp-dap' 			-- autocompletion for nvim-dap
	--------------------
	Plug 'preservim/tagbar'				-- browse the tags of the current file and get an overview of its structure 
	Plug('nvim-treesitter/nvim-treesitter', {
		['do'] = function()
			vim.cmd(':TSUpdate')
		end
	})
	Plug 'nvim-treesitter/nvim-treesitter-context'
	Plug('catppuccin/nvim', {as = 'catppuccin'})	-- theme
	Plug 'mateuszwieloch/automkdir.nvim'		-- create intermediate folder
	Plug 'nvimdev/dashboard-nvim'			-- dashboard
	Plug 'nvim-tree/nvim-web-devicons'		-- icons
	Plug 'nvim-lua/plenary.nvim'			-- lua functions
	Plug 'nvim-telescope/telescope.nvim'		-- fuzzy finder
	Plug 'numToStr/Comment.nvim'			-- commenting plugin
	Plug 'lukas-reineke/indent-blankline.nvim'	-- adds indentation guides
	Plug 'windwp/nvim-autopairs'			-- autopair
	Plug 'akinsho/bufferline.nvim'			-- buffer line with tabpage integration
	Plug 'tzachar/local-highlight.nvim'		-- hghlight uses of word under the cursor
	Plug 'tpope/vim-repeat'				-- general-purpose motion plugin
	Plug 'ggandor/leap.nvim'
	Plug 'rmagatti/goto-preview'			-- preview native LSP's goto definition
	-- Plug 'mfussenegger/nvim-lint'
	Plug 'sindrets/diffview.nvim'			-- preview all git diffs
	Plug 'dstein64/nvim-scrollview'
	Plug 'mfussenegger/nvim-dap' 			-- Debug Adapter Protocol implementation
	Plug 'mfussenegger/nvim-jdtls' 			-- Java Extension for LSP
	Plug 'leoluz/nvim-dap-go' 			-- Go extension for delve (debugger)
	Plug 'nvim-neotest/nvim-nio' 			-- asynchronous IO in Neovim
	Plug 'rcarriga/nvim-dap-ui' 			-- A UI for nvim-dap
	Plug 'ThePrimeagen/harpoon' 			-- Mark files and access it easily
	Plug 'hrsh7th/cmp-nvim-lsp-signature-help' 		-- Show function signature when you type
	Plug 'aznhe21/actions-preview.nvim' 		-- Preview code actions with telescope
	Plug 'akinsho/toggleterm.nvim' 			-- Terminal emulator
vim.call('plug#end')



