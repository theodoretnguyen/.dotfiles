local setup, npairs = pcall(require, "nvim-autopairs")
if (not setup) then return end

-- [[ Configuration ]]
npairs.setup({
  disable_filetype = { "TelescopePrompt", "tex", "latex" },
})
