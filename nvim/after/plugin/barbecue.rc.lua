local found, bbq = pcall(require, "barbecue")
if (not found) then return end

bbq.setup({})
