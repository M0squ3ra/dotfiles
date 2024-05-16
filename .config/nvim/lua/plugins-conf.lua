require'dashboard'.setup{}
require'nvim-tree'.setup({
	update_focused_file = {
        	enable = true,
        	update_root = true,
        },
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
	}),
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
				nvim_lua = 'Π',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'buffer'},
		{name = 'nvim_lua'},
		{name = 'luasnip'}
	}
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		-- lsp_zero.default_setup,
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		jdtls = lsp_zero.noop,
	},
})
require('mason-tool-installer').setup {
	ensure_installed = {
		'bash-language-server',
		'dockerfile-language-server',
		'gopls',
		'java-debug-adapter',
		'java-test',
		'jdtls',
		'python-lsp-server',
		'typescript-language-server',
		'typos-lsp',
		'vim-language-server',
		'yaml-language-server'
	},
	auto_update = true,
	run_on_start = true,
	debounce_hours = 24
}
require('Comment').setup()
require("ibl").setup({
	exclude = {
		filetypes = {
			"dashboard",
		},
	},
})

require("nvim-autopairs").setup{}

require('gitblame').setup {
	enabled = true,
}

-- require("bufferline").setup{}
local frappe = require("catppuccin.palettes").get_palette "frappe"
require('bufferline').setup {
	highlights = require("catppuccin.groups.integrations.bufferline").get {
        	styles = { "italic", "bold" },
		custom = {
			frappe = {
                		background = { fg = frappe.text },
			},
		},
	},
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
					or (e == "warning" and "" or "" )
				s = s .. n .. sym
			end
			return s
		end,
	}
	
}

-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"python",
		"go"
	},
	-- auto install above language parsers
	auto_install = true,
})

require('local-highlight').setup({
	hlgroup = 'Search',
	cw_hlgroup = nil,
	-- Whether to display highlights in INSERT mode or not
	insert_mode = false,
	min_match_len = 1,
	max_match_len = math.huge,
})

require('leap').create_default_mappings()
require('gitsigns').setup()
require('goto-preview').setup {}


-- DAP
opts = {
	controls = {
		element = "repl",
		enabled = false,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = ""
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
        	expanded = ""
	},
	layouts = {
		{
			elements = {
        			{
					id = "scopes",
			        	size = 0.50
				},
				{
					id = "stacks",
        				size = 0.30
        				},
        			{
        				id = "watches",
        				size = 0.10
        			},
        			{
        				id = "breakpoints",
        				size = 0.10
        			}
        		},
			size = 30,
        		position = "left", -- Can be "left" or "right"
		},
		{
        		elements = {
        			"repl",
        			"console",
        		},
        		size = 10,
        		position = "bottom", -- Can be "bottom" or "top"
		}
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
}
local dap = require('dap')
require('dapui').setup(opts)

dap.listeners.after.event_initialized["dapui_config"] = function()
	require('dapui').open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
-- Commented to prevent DAP UI from closing when unit tests finish
-- require('dapui').close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
-- Commented to prevent DAP UI from closing when unit tests finish
-- require('dapui').close()
end









