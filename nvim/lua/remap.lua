-- keymaps
local map = vim.keymap.set
vim.g.mapleader = ' '
map('i', 'jk', '<Esc>')
map('n', '<leader>w', ':w')
map('n', '<leader>r', ':so<Cr>')
map('n', '<leader>f', function() vim.lsp.buf.format() end)

-- windows
map('n', '<leader>wc', '<C-w>c')
map('n', '<leader>wo', '<C-w>o')
map('n', '<leader>wv', '<C-w>v')
map('n', '<leader>wl', '<C-w>l')
map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')

-- clipboard copy
map({ 'n', 'v', 'x' }, '<leader>y', '\"+y')
map({ 'n', 'v', 'x' }, '<leader>Y', '\"+Y')
map({ 'n', 'v', 'x' }, '<leader>d', '\"+d')
map({ 'n', 'v', 'x' }, '<leader>D', '\"+D')

map('n', '-', ':Oil<Cr>')
