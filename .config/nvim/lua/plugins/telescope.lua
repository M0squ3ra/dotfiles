return {
    'nvim-telescope/telescope.nvim',		-- fuzzy finder
    dependencies = {
        'nvim-lua/plenary.nvim',			-- lua functions
    	'ThePrimeagen/harpoon', 			-- Mark files and access it easily
    },
    config = function()
        require('telescope').load_extension('harpoon')

        vim.keymap.set('n', 'ff', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', 'fg', ':Telescope live_grep<CR>', { noremap = true, silent = true})

        vim.keymap.set("n", "<leader>ha", require('harpoon.mark').add_file, {noremap=true})
        vim.keymap.set("n", "<leader>ht", ':Telescope harpoon marks<CR>', {noremap=true})
    end,
}