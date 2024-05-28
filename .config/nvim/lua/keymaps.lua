-- Mapeo de teclas para pasar al siguiente buffer
vim.keymap.set('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
-- Mapeo de teclas para pasar al buffer anterior
vim.keymap.set('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
-- Cerrar buffer actual
vim.keymap.set('n', '<C-d>', ':bd<CR>', { noremap = true, silent = true })
