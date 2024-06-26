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

-- COMMENTS
-- Normal mode:
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
-- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
-- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
-- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
-- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
-- Visual mode:
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment

require("lazy-conf")
require("options")
require("keymaps")
