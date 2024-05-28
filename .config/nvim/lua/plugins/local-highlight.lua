return {
	"tzachar/local-highlight.nvim", -- hghlight uses of word under the cursor
	config = function()
		require("local-highlight").setup({
			hlgroup = "Search",
			cw_hlgroup = nil,
			-- Whether to display highlights in INSERT mode or notify
			insert_mode = false,
			min_match_len = 1,
			max_match_len = math.huge,
		})
	end,
}
