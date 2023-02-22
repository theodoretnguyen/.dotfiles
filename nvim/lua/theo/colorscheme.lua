local found1, tokyonight = pcall(require, "tokyonight")
if (not found1) then vim.cmd[[colorscheme default]] return end
local found2, kanagawa = pcall(require, "kanagawa")
if (not found2) then vim.cmd[[colorscheme default]] return end

tokyonight.setup({
  style = "moon",
  transparent = false,
  lualine_bold = true,
})

kanagawa.setup({
  transparent = false,
})

vim.cmd[[colorscheme tokyonight]]
