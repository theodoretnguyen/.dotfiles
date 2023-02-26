local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local highlight_yank = augroup('HighlightYank', { clear = true })
autocmd('TextYankPost', {
	group = highlight_yank,
  pattern = { '*' },
	callback = function()
		vim.highlight.on_yank({
			timeout = 40,
		})
	end,
})

local trim_whitespace = augroup('TrimWhitespace', { clear = true })
autocmd({ 'BufWritePre' }, {
	group = trim_whitespace,
  pattern = { '*' },
	command = [[
	let currPos = getpos(".")
	%s/\s\+$//e
	%s/\n\+\%$//e
	cal cursor(currPos[1], currPos[2])
	]],
})

-- Vertically center document when entering insert mode
-- autocmd({ "InsertEnter" }, {
--   pattern = { "*" },
--   command = "norm zz",
-- })

-- Disable automatic commenting on newline
autocmd({ "FileType" }, {
  pattern = { "*" },
  command = "setlocal formatoptions-=cro",
})

-- cpp
autocmd('FileType', {
  pattern = { 'cpp' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
    vim.bo.autoindent = true
    vim.bo.smartindent = true
    vim.bo.textwidth = 0
    vim.wo.colorcolumn = "80"
    vim.wo.linebreak = true
    vim.wo.wrap = false

    -- Compile
    vim.keymap.set("n", "<leader>cc",
    "<cmd>cd %:p:h<cr><cmd>w<cr><cmd>make<cr><cr><cmd>botright cwindow<cr>",
    { silent = true, desc = "Compile" })

    -- Output (floating terminal)
    vim.keymap.set("n", "<leader>co",
    "<cmd>ToggleTerm direction=float<cr>clear<cr>./output<cr>",
    { silent = true, desc = "Output (float)" })

    -- Output (vertical terminal)
    vim.keymap.set("n", "<leader>cO",
    "<cmd>ToggleTerm direction=vertical<cr>clear<cr>./output<cr>",
    { silent = true, desc = "Output (vertical)" })

    -- Clean
    vim.keymap.set("n", "<leader>cl",
    "<cmd>cd %:p:h<cr><cmd>make clean<cr><cr>",
    { silent = true, desc = "Clean" })
end,
})

-- java
autocmd('FileType', {
  pattern = { 'java' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
    vim.bo.autoindent = true
    vim.bo.smartindent = true
    vim.bo.textwidth = 0
    vim.wo.colorcolumn = "80"
    vim.wo.linebreak = true
    vim.wo.wrap = false

    -- Compile
    vim.keymap.set("n", "<leader>cc",
    "<cmd>cd %:p:h<cr><cmd>w<cr><cmd>make<cr><cr>",
    { silent = true, desc = "Compile" }
    )

    -- Output
    vim.keymap.set("n", "<leader>co",
    "<cmd>ToggleTerm<cr>clear<cr>java <tab><cr>",
    { silent = true, desc = "Output" }
    )

    -- Clean
    vim.keymap.set("n", "<leader>cl",
    "<cmd>cd %:p:h<cr><cmd>make clean<cr><cr>",
    { silent = true, desc = "Clean" }
    )
  end,
})

-- markdown
autocmd('FileType', {
  pattern = { 'markdown' },
  callback = function()
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
  end,
})
