local found, ib = pcall(require, "indent_blankline")
if (not found) then return end

ib.setup({})
