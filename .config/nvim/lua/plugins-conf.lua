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

require('plugins-conf/dap')
require('plugins-conf/treesitter')
require('plugins-conf/bufferline')








