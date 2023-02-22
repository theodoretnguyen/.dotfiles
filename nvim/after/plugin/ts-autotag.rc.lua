local found, autotag = pcall(require, "nvim-ts-autotag")
if (not found) then return end

autotag.setup({})
