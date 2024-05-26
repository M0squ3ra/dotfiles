require'dashboard'.setup{}
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

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)



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
require('Comment').setup()
require("ibl").setup({
	exclude = {
		filetypes = {
			"dashboard",
		},
	},
})

require("nvim-autopairs").setup{}

-- require('gitblame').setup {
-- 	enabled = true,
-- }

require('local-highlight').setup({
	hlgroup = 'Search',
	cw_hlgroup = nil,
	-- Whether to display highlights in INSERT mode or not
	insert_mode = false,
	min_match_len = 1,
	max_match_len = math.huge,
})

require('leap').create_default_mappings()
require('gitsigns').setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
})
require('goto-preview').setup {}
require('telescope').load_extension('harpoon')

require('plugins-conf/cmp')
require('plugins-conf/dap')
require('plugins-conf/treesitter')
require('plugins-conf/bufferline')
