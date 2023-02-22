local found, kanagawa = pcall(require, "kanagawa")
if (not found) then return end

-- [[ Configuration ]]
kanagawa.setup({
  transparent = false,
})
