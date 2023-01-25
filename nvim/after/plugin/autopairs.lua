-- [[ Imports ]]
local autopairs_setup, npairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end
local autotag_setup, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_setup then
  return
end
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

-- [[ Configuration ]]
npairs.setup({
  disable_filetype = { "TelescopePromt", "tex", "latex" },
  disable_in_macro = false,  -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  ignored_next_char = [=[[%w%%%'%[%"%.]]=],
  enable_moveright = true,
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  --- check bracket in same line
  enable_bracket_in_quote = true, --
  break_undo = true, -- switch for basic rule break undo sequence
  check_ts = false,
  map_cr = true,
  map_bs = true,  -- map the <BS> key
  map_c_h = false,  -- Map the <C-h> key to delete a pair
  map_c_w = false, -- map <c-w> to delete a pair if possible
})
autotag.setup()

-- Have nvim-cmp and autopairs work together
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- [[ Custom autopair rules ]]
-- local Rule = require("nvim-autopairs.rule")
-- local cond = require("nvim-autopairs.conds")
