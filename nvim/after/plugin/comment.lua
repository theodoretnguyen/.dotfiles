-- [[ Imports ]]
local comment_setup, comment = pcall(require, "Comment")
if not comment_setup then
  return
end

-- [[ Configuration ]]
comment.setup({
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  extra = {
    above = "gcO",
    below = "gco",
    eol = "gcA",
  },
  mappings = {
    basic = true,
    extra = true,
  },
  pre_hook = nil,
  post_hook = nil,
})
