return {
  "folke/which-key.nvim",
  config = function()
    local whichkey = require('which-key')

    whichkey.register({
      f = { name = "Find" },
      l = { name = "LSP" },
      s = { name = "Split"},
      c = { name = "Make"},
      m = { name = "Markdown"},
      h = { name = "Harpoon"},
      G = { name = "Git" },
      x = { name = "Trouble" },
      y = { name = "which_key_ignore" },
      d = { name = "which_key_ignore" },
      t = { name = "Tabs" },
      z = "Zen Mode",
      ["<space>"] = "Buffers",
      ["1"] = "which_key_ignore",
      ["2"] = "which_key_ignore",
      ["3"] = "which_key_ignore",
      ["4"] = "which_key_ignore",
      ["a"] = "which_key_ignore",
      ["A"] = "which_key_ignore",
    }, { prefix = "<leader>" })

    whichkey.register({
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

    whichkey.setup({
      key_labels = {
        ["<space>"] = "SPC",
      },
      window = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
      ignore_missing = false,
      show_help = false,
      show_keys = true,
      triggers = "auto",
    })
  end,
}
