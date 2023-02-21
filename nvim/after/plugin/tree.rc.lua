local setup, tree = pcall(require, "nvim-tree")
if (not setup) then return end

-- [[ Keymaps ]]
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { silent = true, desc = "File Explorer" })

-- [[ Configuration ]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

tree.setup({})
