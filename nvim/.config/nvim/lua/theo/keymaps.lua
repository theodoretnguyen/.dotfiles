-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Unmap Q
vim.keymap.set('n', 'Q', '<nop>')

-- Save and quit
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Write' })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })

-- Better paste
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Better deletion
vim.keymap.set( { 'n', 'v' }, '<leader>d', [["_d]])
vim.keymap.set( 'n', 'x', [["_x]])

-- Yank into system register
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])

-- Yank from cursor to end of line
vim.keymap.set('n', 'Y', 'yg$')

-- Join lines without cursor moving
vim.keymap.set('n', 'J', "mzJ`z")

-- Move visual blocks up and down
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", { silent = true })

-- Vertical navigation accounting for word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})

-- Center word when going through searches
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Center word when going half page up/down
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')

-- Stay in indent mode when indenting/unindenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Netrw
-- vim.keymap.set('n', '<leader>e', '<cmd>Lexplore<cr>', { desc = "File Explorer" } )

-- Buffers
vim.keymap.set('n', '<tab>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<s-tab>', '<cmd>bprevious<cr>')

-- Tabs
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>', { desc = 'New' } )
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<cr>', { desc = 'Next' } )
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<cr>', { desc = 'Prev' } )
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<cr>', { desc = 'Close' } )

-- Windows
vim.keymap.set('n', '<leader>sv', '<c-w>v', { desc = 'Vertical' } )
vim.keymap.set('n', '<leader>sh', '<c-w>s', { desc = 'Horizontal' } )
vim.keymap.set('n', '<leader>se', '<c-w>=', { desc = 'Equalize' } )
vim.keymap.set('n', '<leader>sx', '<c-w>c', { desc = 'Close' } )
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Terminals
vim.keymap.set("t", "<esc>", [[<c-\><c-n>]])
vim.keymap.set("t", "<c-h>", [[<cmd>wincmd h<cr>]])
vim.keymap.set("t", "<c-j>", [[<cmd>wincmd j<cr>]])
vim.keymap.set("t", "<c-k>", [[<cmd>wincmd k<cr>]])
vim.keymap.set("t", "<c-l>", [[<cmd>wincmd l<cr>]])

-- Change directory
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<cr><cmd>pwd<cr>', { desc = 'Change Working Directory' } )

-- Replace all
vim.keymap.set('n', '<leader>r', ':%s//g<left><left>', { desc = 'Replace All' } )

-- Orthography
vim.keymap.set('n', '<leader>o', '<cmd>set spell! spelllang=en_us<cr>', { desc = 'Orthography' } )

-- Clear highlight
vim.keymap.set('n', '<leader>/', '<cmd>nohl<cr>', { desc = 'Clear Highlights' } )

-- Close buffer
vim.keymap.set('n', '<leader>.', '<cmd>bd<cr>', { desc = 'Close Buffer' } )

-- Perform dot command on visual blocks
vim.keymap.set('v', '.', ':normal .<cr>', { silent = true })
