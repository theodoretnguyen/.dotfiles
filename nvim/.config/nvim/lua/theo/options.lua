vim.o.fileencoding = 'utf-8'
vim.o.updatetime = 50
vim.o.makeprg = 'gmake'
vim.o.swapfile = false
vim.g.loaded_perl_provider = 0

-- vim.o.guicursor = ''
vim.o.termguicolors = true
vim.o.cursorline = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.showtabline = 1
vim.o.showcmd = false
vim.o.laststatus = 3
vim.o.showmode = false
-- vim.o.winbar = [[ %f %m]]
-- vim.o.statusline = [[ %y%=%f %m%=%l,%c %P ]]

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 8

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.textwidth = 0
vim.o.colorcolumn = '80'
vim.o.linebreak = false
vim.o.wrap = false
vim.o.breakindent = false

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.timeout = true
vim.o.timeoutlen = 500
vim.o.ttimeout = true
vim.o.ttimeoutlen = 20

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = 25

-- [[ Python virtual environment ]]
-- Install miniconda through Homebrew: brew install miniconda
-- Create conda environment: conda create -n pynvim
-- Activate conda environment: conda activate pynvim
-- Install pip: conda install pip
-- Install pynvim: conda install pynvim
-- Copy path to python: which python
vim.g.python3_host_prog = '/opt/homebrew/Caskroom/miniconda/base/envs/pynvim/bin/python'
