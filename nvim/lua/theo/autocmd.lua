-- Automatically deletes all trailing whitespace and newlines at end of file on save & reset cursor position
local trimWhiteSpace = vim.api.nvim_create_augroup("trimWhiteSpace", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = trimWhiteSpace,
  pattern = { "*" },
  command = [[let currPos = getpos(".")]],
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = trimWhiteSpace,
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = trimWhiteSpace,
  pattern = { "*" },
  command = [[%s/\n\+\%$//e]],
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = trimWhiteSpace,
  pattern = { "*.[ch]" },
  command = [[%s/\%$/\r/e]],
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = trimWhiteSpace,
  pattern = "*",
  command = [[cal cursor(currPos[1], currPos[2])]],
})

-- Vertically center document when entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = { "*" },
  command = "norm zz",
})

-- Disable automatic commenting on newline
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  command = "setlocal formatoptions-=cro",
})

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
