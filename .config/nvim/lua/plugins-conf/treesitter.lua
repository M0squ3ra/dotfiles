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
		"java",
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
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scope_incremental            
				["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
				["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
				["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
				["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
			
				["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
				["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
				
				["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
				["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
				
				["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
				["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
				
				["ac"] = { query = "@call.outer", desc = "Select outer part of a function call" },
				["ic"] = { query = "@call.inner", desc = "Select inner part of a function call" },
				
				["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
				["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
				
				["aC"] = { query = "@class.outer", desc = "Select outer part of a class" },
				["iC"] = { query = "@class.inner", desc = "Select inner part of a class" },
			},
		},
	},
})
