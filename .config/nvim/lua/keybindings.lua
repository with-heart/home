local map = require('utils.keymap').map
local mapcmd = require('utils.keymap').mapcmd

-- Telescope
mapcmd('<leader>ff', 'Telescope find_files')
mapcmd('<c-p>', 'Telescope find_files')
mapcmd('<d-p>', 'Telescope find_files')
mapcmd('<leader>fb', 'Telescope buffers')

-- pre-populate splits to current file's location
mapcmd('<leader>e', 'e <C-R>=expand("%:p:h") . "/"')
mapcmd('<leader>ve', 'vsplit <C-R>=expand("%:p:h") . "/"')

-- copy to system clipboard
map('v', '<C-c>', '"+y')
-- paste from system clipboard with C-v
map('i', '<C-v>', '<Esc>"+p')

-- toggle between last 2 buffers
map('n', '<leader><tab>', '<c-^>')

-- 0 goes to first character in line
map('n', '0', '^')
map('n', '^', '0')
