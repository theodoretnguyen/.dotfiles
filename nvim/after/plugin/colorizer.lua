-- [[ Imports ]]
local colorizer_setup, colorizer = pcall(require, "colorizer")
if not colorizer_setup then
  return
end

-- [[ Configuration ]]
colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = false,
    AARRGGBB = false,
    rgb_fn = false,
    hsl_fn = false,
    css = false,
    css_fn = false,
    mode = "background",
    tailwind = false,
    virtualtext = "■",
  },
  buftypes = {},
})
