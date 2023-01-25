-- General
vim.o.compatible = false
vim.o.encoding = "utf-8"
vim.o.title = true
vim.o.mouse = "a"
vim.o.guioptions = a
vim.o.updatetime = 50
vim.o.makeprg = "gmake"

vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.hidden = true

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showtabline = 2
vim.o.showcmd = false
vim.o.showmode = false

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.clipboard = ""

-- Number
vim.cmd("syntax enable")
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.scrolloff = 8

-- Tab/Wrap
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.textwidth = 0
vim.o.colorcolumn = "80"
vim.o.linebreak = false
vim.o.wrap = false

-- Cursor line
vim.o.cursorline = false

-- Search
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true

-- Timeout
vim.o.timeout = true
vim.o.timeoutlen = 500
vim.o.ttimeout = true
vim.o.ttimeoutlen = 20

-- Wildmenu
vim.o.wildmenu = true
vim.opt.wildmode = { "longest", "list", "full" }

-- Netrw
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

-- [[ Python virtual environment ]]
-- Install miniconda through Homebrew: brew install miniconda
-- Create conda environment: conda create -n pynvim
-- Activate conda environment: conda activate pynvim
-- Install pip: conda install pip
-- Install pynvim: conda install pynvim
-- Copy path to python: which python
vim.g.python3_host_prog='/opt/homebrew/Caskroom/miniconda/base/envs/pynvim/bin/python'
