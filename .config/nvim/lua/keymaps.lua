-- check current mapping:
-- :nmap normal mode
-- :vmap visual mode
-- :imap insert mode
-- :map <prefix> check mapping for prefix

vim.keymap.set('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ff', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'fg', ':Telescope live_grep<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<F11>', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
-- Mapeo de teclas para pasar al siguiente buffer
vim.keymap.set('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
-- Mapeo de teclas para pasar al buffer anterior
vim.keymap.set('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
-- Cerrar buffer actual
vim.keymap.set('n', '<C-d>', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
vim.keymap.set("n", "<leader>ha", require('harpoon.mark').add_file, {noremap=true})
-- vim.keymap.set("n", "<leader>ht", require('harpoon.ui').toggle_quick_menu, {noremap=true})
vim.keymap.set("n", "<leader>ht", ':Telescope harpoon marks<CR>', {noremap=true})
vim.keymap.set("n", "<leader>tf", ':ToggleTerm direction=float<CR>', {noremap=true})
vim.keymap.set("n", "<leader>tt", ':ToggleTerm direction=tab<CR>', {noremap=true})

function attach_to_debug()
  local dap = require('dap')
  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Attach to the process";
      hostName = 'localhost';
      port = '5005';
    },
  }
  dap.continue()
end 

vim.keymap.set('n', '<leader>da', ':lua attach_to_debug()<CR>')

-- setup debug
vim.keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
vim.keymap.set('n', '<leader>bl', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')
-- move in debug
vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<F7>', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<F8>', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<S-F8>', ':lua require"dap".step_out()<CR>')

-- view information in debug
function show_dap_centered_scopes()
  local widgets = require'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end


vim.keymap.set('n', 'gs', ':lua show_dap_centered_scopes()<CR>')




