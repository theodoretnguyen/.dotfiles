local setup, kanagawa = pcall(require, "kanagawa")
if (not setup) then return end

-- [[ Configuration ]]
kanagawa.setup({
  transparent = false,
})
