return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Autoinstall plugins and tools
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"SergioRibera/cmp-dotenv",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp-signature-help", -- Show function signature when you type
		"mfussenegger/nvim-jdtls", -- Java Extension for LSP
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
			}),
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "λ",
						luasnip = "⋗",
						buffer = "Ω",
						nvim_lua = "Π",
						dotenv = "Σ",
					}
					if entry.source.name == "path" then
						local is_directory = entry:get_completion_item().label:sub(-1) == "/"
						item.menu = is_directory and "📂" or "📄"
					else
						item.menu = menu_icon[entry.source.name] or ""
					end
					return item
				end,
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "path" },
				{ name = "dotenv" },
			},
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				-- lsp_zero.default_setup,
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				jdtls = lsp_zero.noop,
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"bash-language-server",
				"dockerfile-language-server",
				"gopls",
				"java-debug-adapter",
				"java-test",
				"checkstyle",
				"delve",
				"jdtls",
				"python-lsp-server",
				"typescript-language-server",
				"typos-lsp",
				"vim-language-server",
				"yaml-language-server",
				"eslint_d",
				"pylint",
				"google-java-format",
				"stylua",
				"jq",
				"yamlfmt",
				"clang-format",
			},
			auto_update = true,
			run_on_start = true,
			debounce_hours = 24,
		})
	end,
}
