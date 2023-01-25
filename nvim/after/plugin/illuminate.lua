-- [[ Imports ]]
local illuminate_setup, illuminate = pcall(require, "illuminate")
if not illuminate_setup then
  return
end

-- [[ Configuration ]]
illuminate.configure({
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  delay = 100,
  filetype_overrides = {},
  filetypes_denylist = {
    'dirvish',
    'fugitive',
  },
  filetypes_allowlist = {},
  modes_allowlist = {},
  large_file_cutoff = nil,
  large_file_overrides = nil,
  min_count_to_highlight = 1,
})
