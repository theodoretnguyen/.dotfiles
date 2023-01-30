-- [[ Imports ]]
local which_key_setup, which_key = pcall(require, "which-key")
if not which_key_setup then
  return
end

-- [[ Keymaps ]]
which_key.register({
  f = "Find",
  l = "LSP",
  s = "Split",
  c = "Make",
  m = "Markdown",
  h = "Harpoon",
  g = "Git",
  y = "which_key_ignore",
  d = "which_key_ignore",
  C = "Cellular Automaton",
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["a"] = "which_key_ignore",
  ["A"] = "which_key_ignore",
}, { prefix = "<leader>" })

which_key.register({
  x = "Trouble",
}, { prefix = "<leader>" })

which_key.register({
  l = {
    name = "LaTeX",
    i = "Info",
    I = "Info Full",
    t = "TOC Open",
    T = "TOC Toggle",
    q = "Log",
    v = "View",
    r = "Reverse Search",
    l = "Compile",
    L = "Compile Selected",
    k = "Stop",
    K = "Stop All",
    e = "Errors",
    o = "Compile Output",
    g = "Status",
    G = "Status All",
    c = "Clean",
    C = "Clean Full",
    m = "Insert Mode Keymappings",
    x = "Reload",
    X = "Reload State",
    s = "Toggle Main",
    a = "Context Menu",
  },
}, { prefix = "<localleader>" })

-- [[ Configuration ]]
which_key.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  operators = {},
  key_labels = {
    ["<space>"] = "SPC",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-j>",
    scroll_up = "<c-k>",
  },
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 5,
    align = "center",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = false,
  show_keys = true,
  triggers = { "<leader>", "<localleader>" },
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
})
