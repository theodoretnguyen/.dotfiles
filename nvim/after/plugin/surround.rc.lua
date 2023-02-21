-- [[ Imports ]]
local nvim_surround_setup, nvim_surround = pcall(require, "nvim-surround")
if not nvim_surround_setup then
  return
end

-- [[ Configuration ]]
nvim_surround.setup({})
