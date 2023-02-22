local found, surround = pcall(require, "nvim-surround")
if (not found) then return end

-- [[ Configuration ]]
surround.setup({})
