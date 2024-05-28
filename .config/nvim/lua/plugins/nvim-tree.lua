return {
    'nvim-tree/nvim-tree.lua',			-- file explorer
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require('nvim-tree').setup({
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
        vim.keymap.set('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
}