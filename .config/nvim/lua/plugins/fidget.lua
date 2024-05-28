return {
    'j-hui/fidget.nvim' ,			-- UI for Neovim notifications and LSP progress messages
    config = function()
        require("fidget").setup {
            progress = {
                display = {
                    render_limit = 14,
                }
            }
        }
    end,
}