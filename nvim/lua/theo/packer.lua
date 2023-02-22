-- [[ Bootstrap packer ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

if packer_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
end

local status, packer = pcall(require, "packer")
if (not status) then return end

-- Automatically source and re-compile packer whenever you save this packer.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  group = packer_group,
  pattern = "packer.lua",
})

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({
        border = "rounded",
      })
    end,
  },
})

-- [[ Install plugins ]]
packer.startup(function(use)
  -- [[ Package Manager ]]
  use("wbthomason/packer.nvim")

  -- [[ Colorschemes ]]
  use({
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
  })

  -- [[ File Navigation ]]
  use({
    {
      "nvim-tree/nvim-tree.lua",
      requires = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      requires = { "nvim-lua/plenary.nvim" },
    },
    { "ThePrimeagen/harpoon" }
  })

  -- [[ Treesitter ]]
  use({
    {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        pcall(require("nvim-treesitter.install").update({ with_sync = true }))
      end,
    },
    -- Additional text objects via treesitter
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = { "nvim-treesitter" },
      requires = { "nvim-treesitter/nvim-treesitter" },
    },
  })

  -- [[ Git ]]
  use("lewis6991/gitsigns.nvim")

  -- [[ Navigation ]]
  use({
    { "christoomey/vim-tmux-navigator", disable = true }, -- tmux
    {
      "knubie/vim-kitty-navigator", -- kitty
      run = "cp ./*.py ~/.config/kitty/",
    },
  })

  -- [[ Extra Functionality ]]
  use({
    "kylechui/nvim-surround", -- surround objects
    "windwp/nvim-autopairs", -- auto-close delimiters
    {
      "windwp/nvim-ts-autotag", -- auto-close tags
      after = { "nvim-treesitter" },
    },
    "numToStr/Comment.nvim", -- comments
    "akinsho/toggleterm.nvim", -- terminal
    "NvChad/nvim-colorizer.lua", -- colorizer
  })

  -- [[ Niceties ]]
  use({
    {
      "lukas-reineke/indent-blankline.nvim", -- indentation guides
      disable = false,
    },
    { "nvim-lualine/lualine.nvim" }, -- statusline
    {
      "akinsho/bufferline.nvim", -- bufferline
      tag = "v3.*",
      requires = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "utilyre/barbecue.nvim", -- winbar
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
      },
      after = "nvim-web-devicons",
    },
    { "folke/which-key.nvim" }, -- which-key
    {
      "folke/trouble.nvim", -- pretty Diagnostics
      require = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "folke/zen-mode.nvim", -- zen
      requires = { "folke/twilight.nvim" },
    },
  })

  -- [[ Autocompletion ]]
  use({
    "hrsh7th/nvim-cmp",
    -- sources
    "hrsh7th/cmp-nvim-lsp", -- nvim_lsp : LSP source
    "saadparwaiz1/cmp_luasnip", -- luasnip : snippets source
    "hrsh7th/cmp-nvim-lua", -- nvim_lua : neovim's lua api
    "hrsh7th/cmp-buffer", -- buffer : buffer source
    "hrsh7th/cmp-path", -- path : filesystem paths source
    "hrsh7th/cmp-cmdline", -- cmdline : command line suggestions
    -- kind icons
    "onsails/lspkind.nvim",
    -- snippets plugin
    "L3MON4D3/LuaSnip",
    -- vscode snippets collection
    "rafamadriz/friendly-snippets",
  })

  -- [[ LSP ]]
  use({
    "neovim/nvim-lspconfig",
    -- lsp installer
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- useful status updates for LSP
    "j-hui/fidget.nvim",
    {
      "glepnir/lspsaga.nvim",
      branch = "main",
      requires = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    },
    -- colors for diagnostics
    "folke/lsp-colors.nvim",
    -- formatters and linters
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "jayp0521/mason-null-ls.nvim",
  })

  -- [[ Markup ]]
  use({
    "lervag/vimtex", -- LaTeX
    {
      "iamcco/markdown-preview.nvim", -- markdown previewer
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    {
      "NFrid/markdown-togglecheck", -- checkboxes
      requires = { "NFrid/treesitter-utils" },
    },
  })

  -- [[ Miscellaneous ]]
  use("eandrju/cellular-automaton.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
