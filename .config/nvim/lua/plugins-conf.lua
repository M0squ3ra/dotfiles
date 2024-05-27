require'dashboard'.setup{}

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('plugins-conf/cmp')
require('plugins-conf/dap')
require('plugins-conf/treesitter')
require('plugins-conf/bufferline')
require('plugins-conf/actions-preview')
require('plugins-conf/toggleterm')
require('plugins-conf/local-highlight')
require('plugins-conf/gitsigns')
require('plugins-conf/ibl')
require('plugins-conf/fidget')

require('Comment').setup()
require('nvim-autopairs').setup{}
require('leap').create_default_mappings()
require('goto-preview').setup {}
require('telescope').load_extension('harpoon')
require'nvim-tree'.setup({
	update_focused_file = {
        	enable = true,
        	update_root = true,
        },
	view = {
		adaptive_size = true,
		centralize_selection = true,
	},
	renderer = {
		highlight_opened_files = "name",
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
		'delve',
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

