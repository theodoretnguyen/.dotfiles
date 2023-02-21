local setup, trouble = pcall(require, "trouble")
if (not setup) then return end

-- [[ Keymaps ]]
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "LSP References" })

-- [[ Configuration ]]
trouble.setup({
  auto_close = true,
  auto_preview = true,
  auto_fold = false,
  use_diagnostic_signs = false,
})
