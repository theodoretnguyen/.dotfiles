-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Unmap Q
vim.keymap.set("n", "Q", "<nop>")

-- Quit/Save/Source file
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = true, desc = "Save" })

-- True paste over visual selection
vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true })

-- True deletion
vim.keymap.set( {"n", "v" }, "<leader>d", [["_d]], { silent = true })

-- Yank into system register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true })

-- Yank from cursor to end of line
vim.keymap.set("n", "Y", "yg$", { silent = true })

-- Join lines without cursor moving
vim.keymap.set("n", "J", "mzJ`z", { silent = true })

-- Move visual blocks up and down
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Vertical navigation accounting for word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Center word when going through searches
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Center word when going half page up/down
vim.keymap.set("n", "<c-u>", "<c-u>zz", { silent = true })
vim.keymap.set("n", "<c-d>", "<c-d>zz", { silent = true })

-- Stay in indent mode when indenting/unindenting
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- Windows
vim.keymap.set("n", "<leader>sv", "<c-w>v", { silent = true, desc = "Vertical" })
vim.keymap.set("n", "<leader>sh", "<c-w>s", { silent = true, desc = "Horizontal" })
vim.keymap.set("n", "<leader>se", "<c-w>=", { silent = true, desc = "Equalize" })
vim.keymap.set("n", "<leader>sx", "<c-w>c", { silent = true, desc = "Close" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { silent = true })
vim.keymap.set("n", "<c-j>", "<c-w>j", { silent = true })
vim.keymap.set("n", "<c-k>", "<c-w>k", { silent = true })
vim.keymap.set("n", "<c-l>", "<c-w>l", { silent = true })

-- Change directory
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>pwd<cr>", { silent = true, desc = "cd to Current Folder" })

-- Replace all
vim.keymap.set("n", "<leader>r", ":%s//g<Left><Left>", { silent = false, desc = "Replace All"})

-- Orthography
vim.keymap.set("n", "<leader>o", "<cmd>set spell! spelllang=en_us<cr>", { silent = true, desc = "Spell-check" })

-- Clear highlight
vim.keymap.set("n", "<leader>/", "<cmd>nohl<cr>", { silent = true, desc = "Clear highlight" })

-- Close buffer
vim.keymap.set("n", "<leader>.", "<cmd>bd<cr>", { silent = true, desc = "Close buffer" })

-- Perform dot command on visual blocks
vim.keymap.set("v", ".", ":normal .<cr>", { silent = true })
