
-- Make the changes take effect: :so

-- VIM Cheatsheet
-- v: enters visual mode and selects text
-- V: selects entire line
-- y: copy selected text
-- c: change text (deletes and set cursor)
-- Keyboard mapping
-- FOLDING
-- zo: open a single fold under the cursor
-- zc: close the fold under the cursor
-- zR: open all folds
-- zM: close all folds


require('plugins')
require('plugins-conf')
vim.cmd('colorscheme onedark')
require('options')
require('keymaps')
