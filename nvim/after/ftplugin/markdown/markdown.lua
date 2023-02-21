-- [[ vim options ]]
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.o.smarttab = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.textwidth = 0
vim.wo.colorcolumn = ""
vim.wo.linebreak = true
vim.wo.wrap = true
vim.o.breakindent = true

-- [[ Keymaps ]]

-- PDF
vim.keymap.set("n", "<leader>mp",
  "<cmd>cd %:p:h<cr><cmd>w<cr><cmd>!pandoc %:t -o %:t:r.pdf<cr><cr>",
  { silent = true, desc = "PDF" }
)

-- PDF Slides
vim.keymap.set("n", "<leader>ms",
  "<cmd>cd %:p:h<cr><cmd>w<cr><cmd>!pandoc -t beamer %:t -o %:t:r-slides.pdf<cr><cr>",
  { silent = true, desc = "PDF Slides" }
)

-- Markmap-cli
vim.keymap.set("n", "<leader>mt",
  "<cmd>ToggleTerm<cr>markmap -w ~/TODO.md<cr>",
  { silent = true, desc = "Markmap" }
)
