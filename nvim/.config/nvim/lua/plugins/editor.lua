return {
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    opts = {
      disable_filetype = { "TelescopePrompt", "tex", "latex" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "php", },
    dependencies = { "nvim-treesitter" },
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" } },
      { "gb", mode = { "n", "v" } },
    },
    config = true,
  },
  {
    "kylechui/nvim-surround",
    keys = {
      { "ds", mode = "n" },
      { "cs", mode = "n" },
      { "ys", mode = "n" },
      { "yS", mode = "n" },
      { "S",  mode = "v" },
      { "gS", mode = "v" },
    },
    config = true,
  },
}
