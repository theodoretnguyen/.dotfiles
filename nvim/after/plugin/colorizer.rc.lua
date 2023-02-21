local setup, colorizer = pcall(require, "colorizer")
if (not setup) then return end

-- [[ Configuration ]]
colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    mode = "virtualtext",
  },
})
