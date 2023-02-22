local found, togglecheck = pcall(require, "markdown-togglecheck")
if (not found) then return end

-- [[ Keymaps ]]
vim.keymap.set("n", "<leader>mm",
  togglecheck.toggle, { silent = true, desc = "Check/Uncheck" }
)
vim.keymap.set("n", "<leader>mM",
  togglecheck.toggle_box, { silent = true, desc = "Box/Unbox" }
)

-- [[ Configuration ]]
togglecheck.setup({
  create = true,
  remove = false,
})
