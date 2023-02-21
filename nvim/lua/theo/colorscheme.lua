-- [[ Imports ]]
local tokyonight_setup, tokyonight = pcall(require, "tokyonight")
if not tokyonight_setup then
  return
end
local kanagawa_setup, kanagawa = pcall(require, "kanagawa")
if not kanagawa_setup then
  return
end
local one_monokai_setup, one_monokai = pcall(require, "one_monokai")
if not one_monokai_setup then
  return
end
local onenord_setup, onenord = pcall(require, "onenord")
if not onenord_setup then
  return
end
local rose_pine_setup, rose_pine = pcall(require, "rose-pine")
if not rose_pine_setup then
  return
end
local catppuccin_setup, catppuccin = pcall(require, "catppuccin")
if not catppuccin_setup then
  return
end

-- [[ Tokyonight ]]
tokyonight.setup({
  style = "storm",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help", "packer" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
})

-- [[ Kanagawa ]]
kanagawa.setup({
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true },
  specialReturn = true,
  specialException = true,
  transparent = false,
  dimInactive = false,
  globalStatus = false,
  terminalColors = true,
  colors = {},
  overrides = {},
  theme = "default",
})

-- [[ One Monokai ]]
one_monokai.setup({
  transparent = false,
})

-- [[ Onenord ]]
onenord.setup({
  theme = "dark",
  borders = true,
  fade_nc = false,
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = false,
    cursorline = false,
    eob_lines = true,
  },
  inverse = {
    match_paren = false,
  },
  custom_highlights = {},
  custom_colors = {},
})

-- [[ Rose Pine ]]
rose_pine.setup({
  dark_variant = 'main',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,
  groups = {
    background = 'base',
    panel = 'surface',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',
    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',
    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
  },
  highlight_groups = {
    ColorColumn = { bg = 'rose' }
  }
})

-- [[ Catppuccin ]]
catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = false,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
  },
})

vim.o.termguicolors = true
vim.o.background = "dark"
pcall(vim.cmd, "colorscheme nightfly")
