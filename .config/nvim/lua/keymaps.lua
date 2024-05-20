-- check current mapping:
-- :nmap normal mode
-- :vmap visual mode
-- :imap insert mode
-- :map <prefix> check mapping for prefix

vim.keymap.set('n', 'nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'ff', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'fg', ':Telescope live_grep<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<F11>', ':TagbarToggle<CR>', { noremap = true, silent = true })
-- Mapeo de teclas para pasar al siguiente buffer
vim.keymap.set('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })
-- Mapeo de teclas para pasar al buffer anterior
vim.keymap.set('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
vim.keymap.set("n", "<leader>ha", require('harpoon.mark').add_file, {noremap=true})
-- vim.keymap.set("n", "<leader>ht", require('harpoon.ui').toggle_quick_menu, {noremap=true})
vim.keymap.set("n", "<leader>ht", ':Telescope harpoon marks<CR>', {noremap=true})



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
-- run debug
function get_test_runner(test_name, debug)
  if debug then
    return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"' 
  end
  return 'mvn test -Dtest="' .. test_name .. '"' 
end

function run_java_test_method(debug)
  local utils = require'utils'
  local method_name = utils.get_current_full_method_name("\\#")
  vim.cmd('term ' .. get_test_runner(method_name, debug))
end

function run_java_test_class(debug)
  local utils = require'utils'
  local class_name = utils.get_current_full_class_name()
  vim.cmd('term ' .. get_test_runner(class_name, debug))
end

function get_spring_boot_runner(profile, debug)
  local debug_param = ""
  if debug then
    debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
  end 

  local profile_param = ""
  if profile then
    profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
  end

  return 'mvn spring-boot:run ' .. profile_param .. debug_param
end
function run_spring_boot(debug)
  vim.cmd('term ' .. get_spring_boot_runner(method_name, debug))
end

-- Java specific keybindings
vim.keymap.set("n", "<leader>tm", function() run_java_test_method() end)
vim.keymap.set("n", "<leader>TM", function() run_java_test_method(true) end)
vim.keymap.set("n", "<leader>tc", function() run_java_test_class() end)
vim.keymap.set("n", "<leader>TC", function() run_java_test_class(true) end)
vim.keymap.set("n", "<F9>", function() run_spring_boot() end)
vim.keymap.set("n", "<F10>", function() run_spring_boot(true) end)
