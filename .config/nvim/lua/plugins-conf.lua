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

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = false}),
	}),
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})
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
		"python"
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
require('lint').linters_by_ft = {
	markdown = {'vale',},
	javascript = {'eslint_d'},
	typescript = {'eslint_d'},
	python = {'pylint'}
}
vim.api.nvim_create_autocmd({ "BufEnter","BufWritePost", "InsertLeave", "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
