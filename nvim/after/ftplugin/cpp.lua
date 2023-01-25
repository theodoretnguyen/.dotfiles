-- [[ vim options ]]
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.textwidth = 0
vim.wo.colorcolumn = "80"
vim.wo.linebreak = true
vim.wo.wrap = false

-- [[ Keymaps ]]

-- Compile
vim.keymap.set("n", "<leader>cc",
  "<cmd>cd %:p:h<cr><cmd>w<cr><cmd>make<cr><cr><cmd>botright cwindow<cr>",
  { silent = true, desc = "Compile" }
)

-- Output (floating terminal)
vim.keymap.set("n", "<leader>co",
  "<cmd>ToggleTerm direction=float<cr>clear<cr>./output<cr>",
  { silent = true, desc = "Output (float)" }
)

-- Output (vertical terminal)
vim.keymap.set("n", "<leader>cO",
  "<cmd>ToggleTerm direction=vertical<cr>clear<cr>./output<cr>",
  { silent = true, desc = "Output (vertical)" }
)

-- Clean
vim.keymap.set("n", "<leader>cl",
  "<cmd>cd %:p:h<cr><cmd>make clean<cr><cr>",
  { silent = true, desc = "Clean" }
)
