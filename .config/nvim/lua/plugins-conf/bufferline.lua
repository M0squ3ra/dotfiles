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
