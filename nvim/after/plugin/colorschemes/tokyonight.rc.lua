local setup, tokyonight = pcall(require, "tokyonight")
if (not setup) then return end

-- [[ Configuration ]]
tokyonight.setup({
  style = "moon",
  transparent = false,
  lualine_bold = true,
})
