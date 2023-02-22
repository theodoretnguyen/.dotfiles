local found, zen_mode = pcall(require, "zen-mode")
if (not found) then return end
local twilight = require("twilight")

-- [[ Keymaps ]]
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })

-- [[ Configuration ]]
zen_mode.setup({
  window = {
    backdrop = 1,
    width = 80,
    height = 0.85,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = true },
    gitsigns = { enabled = false },
  },
})
twilight.setup({})
