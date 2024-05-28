return {
	'aznhe21/actions-preview.nvim', 		-- Preview code actions with telescope
	config = function()
		local diff_so_fancy_dir = vim.fn.stdpath('config') .. '/util/diff-so-fancy'
		local hl = require('actions-preview.highlight')
		require('actions-preview').setup {
			highlight_command = {
				hl.diff_so_fancy('path/to/diff-so-fancy')
			},
			telescope = {
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					width = 0.6,
					-- 	height = 0.9,
					-- 	-- 	prompt_position = "top",
					-- 	-- 	preview_cutoff = 20,
					preview_height = function(_, _, max_lines)
						return max_lines - 15
					end,
				},
			},
		}
		vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
    end,
}
