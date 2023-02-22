local found, colorizer = pcall(require, "colorizer")
if (not found) then return end

-- [[ Configuration ]]
colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    mode = "virtualtext",
  },
})
