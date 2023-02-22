local found, tokyonight = pcall(require, "tokyonight")
if (not found) then return end

-- [[ Configuration ]]
tokyonight.setup({
  style = "moon",
  transparent = false,
  lualine_bold = true,
})
