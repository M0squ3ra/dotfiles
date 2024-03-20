vim.keymap.set('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ff', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
-- Mapeo de teclas para pasar al siguiente buffer
vim.keymap.set('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
-- Mapeo de teclas para pasar al buffer anterior
vim.keymap.set('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
