-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Unmap Q
vim.keymap.set("n", "Q", "<nop>")

-- Quit/Save
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- True paste over visual selection
vim.keymap.set("x", "<leader>p", [["_dP]])

-- True deletion
vim.keymap.set( { "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set( "n", "x", [["_x]])

-- Yank into system register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank from cursor to end of line
vim.keymap.set("n", "Y", "yg$")

-- Join lines without cursor moving
vim.keymap.set("n", "J", "mzJ`z")

-- Move visual blocks up and down
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- Vertical navigation accounting for word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Center word when going through searches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Center word when going half page up/down
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")

-- Stay in indent mode when indenting/unindenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Buffers
vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next" })
vim.keymap.set("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>bh", "<cmd>ball<cr>", { desc = "Horizontal" })
vim.keymap.set("n", "<leader>bv", "<cmd>vertical ball<cr>", { desc = "Vertical" })

-- Tabs
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close" })

-- Windows
vim.keymap.set("n", "<leader>sv", "<c-w>v", { desc = "Vertical" })
vim.keymap.set("n", "<leader>sh", "<c-w>s", { desc = "Horizontal" })
vim.keymap.set("n", "<leader>se", "<c-w>=", { desc = "Equalize" })
vim.keymap.set("n", "<leader>sx", "<c-w>c", { desc = "Close" })
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- Change directory
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>pwd<cr>", { desc = "cd to Current Folder" })

-- Replace all
vim.keymap.set("n", "<leader>r", ":%s//g<Left><Left>", { desc = "Replace All"})

-- Orthography
vim.keymap.set("n", "<leader>o", "<cmd>set spell! spelllang=en_us<cr>", { desc = "Spell-check" })

-- Clear highlight
vim.keymap.set("n", "<leader>/", "<cmd>nohl<cr>", { desc = "Clear highlight" })

-- Close buffer
vim.keymap.set("n", "<leader>.", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Perform dot command on visual blocks
vim.keymap.set("v", ".", ":normal .<cr>", { silent = true })
