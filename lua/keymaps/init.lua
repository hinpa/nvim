vim.g.mapleader = ' '
vim.keymap.set('n','<leader>pv',vim.cmd.Ex)
require('keymaps.telescope')

vim.cmd([[nnoremap <C-d> <C-d>zz]])
vim.cmd([[nnoremap <C-u> <C-u>zz]])

