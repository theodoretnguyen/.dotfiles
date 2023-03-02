return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = false,
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = false,
      lualine_bold = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      transparent = false,
    }
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = true,
  },
}
