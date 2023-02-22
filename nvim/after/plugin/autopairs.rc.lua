local found, npairs = pcall(require, "nvim-autopairs")
if (not found) then return end

-- [[ Configuration ]]
npairs.setup({
  disable_filetype = { "TelescopePrompt", "tex", "latex" },
})
