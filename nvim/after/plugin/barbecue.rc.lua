local status, bbq = pcall(require, "barbecue")
if (not status) then return end

bbq.setup({})

require("barbecue")
