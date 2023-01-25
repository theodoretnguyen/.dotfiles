-- [[ Imports ]]
local zen_mode_setup, zen_mode = pcall(require, "zen-mode")
if not zen_mode_setup then
  return
end
local twilight_setup, twilight = pcall(require, "twilight")
if not twilight_setup then
  return
end

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
    twilight = { enabled = false },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    kitty = {
      enabled = true,
      font = "+4",
    },
  },
})
twilight.setup({
  dimming = {
    alpha = 0.25,
    color = { "Normal", "#ffffff" },
    term_bg = "#000000",
    inactive = false,
  },
  context = 10,
  treesitter = true,
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {},
})
