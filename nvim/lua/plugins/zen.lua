return {
  "folke/zen-mode.nvim", -- zen
  dependencies = { "folke/twilight.nvim", config = true },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" } },
  },
  opts = {
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
  }
}
