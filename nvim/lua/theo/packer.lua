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

-- [[ Imports ]]
local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerSync",
  group = packer_group,
  pattern = "packer.lua",
})

-- [[ Install plugins ]]
packer.startup(function(use)
  -- [[ Package Manager ]]
  use("wbthomason/packer.nvim")

  -- [[ Colorschemes ]]
  use({
    -- Colorschemes that have a setup function
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    "cpea2506/one_monokai.nvim",
    "rmehri01/onenord.nvim",
    "rose-pine/neovim",
    "catppuccin/nvim",

    -- Colorschemes that don't have a setup function
    "bluz71/vim-nightfly-colors",
    "bluz71/vim-moonfly-colors",
    "sainnhe/edge",
    "sainnhe/sonokai",
    "sainnhe/gruvbox-material",
    "sainnhe/everforest",
  })

  -- [[ File Explorer ]]
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  })

  -- [[ Fuzzy Finder ]]
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  -- [[ Quick File Navigation ]]
  use("ThePrimeagen/harpoon")

  -- [[ Treesitter ]]
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })
  -- Additional text objects via treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects")
  -- Automatic highlighting (using LSP, treesitter, or regex matching)
  use("RRethy/vim-illuminate")

  -- [[ Git ]]
  use({"lewis6991/gitsigns.nvim"})

  -- [[ Extra Functionality ]]
  -- Surround objects
  use("kylechui/nvim-surround")
  -- Auto-closing
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  -- Comments
  use("numToStr/Comment.nvim")
  -- Terminal
  use("akinsho/toggleterm.nvim")
  -- Colorizer
  use("NvChad/nvim-colorizer.lua")

  -- [[ Niceties ]]
  -- Indentation guides
  use("lukas-reineke/indent-blankline.nvim")
  -- Statusline
  use("nvim-lualine/lualine.nvim")
  -- Bufferline
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
  -- Which-key
  use("folke/which-key.nvim")
  -- Pretty Diagnostics
  use("folke/trouble.nvim")
  -- Zen
  use({
    "folke/zen-mode.nvim",
    "folke/twilight.nvim",
  })

  -- [[ Autocompletion ]]
  use({
    "hrsh7th/nvim-cmp",
    -- [[ Sources ]]
    -- sourceName : description
    "hrsh7th/cmp-nvim-lsp", -- nvim_lsp : LSP source
    "saadparwaiz1/cmp_luasnip", -- luasnip : snippets source
    "hrsh7th/cmp-buffer", -- buffer : buffer source
    "hrsh7th/cmp-path", -- path : filesystem paths source
    "hrsh7th/cmp-cmdline", -- cmdline : command line suggestions
    -- [[ Kind Icons ]]
    "onsails/lspkind.nvim",
    -- [[ Snippets Plugin]]
    "L3MON4D3/LuaSnip",
    -- [[ VSCode Snippets Collection ]]
    "rafamadriz/friendly-snippets",
  })

  -- [[ LSP ]]
  use({
    "neovim/nvim-lspconfig",
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Useful status updates for LSP
    "j-hui/fidget.nvim",
    -- Colors for diagnostics
    "folke/lsp-colors.nvim",
    -- Formatters and Linters
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
  })

  -- [[ Markup ]]
  -- VimTeX
  use("lervag/vimtex")
  -- Markdown Live Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  -- Toggle Checklist
  use({ "NFrid/markdown-togglecheck", requires = "NFrid/treesitter-utils" })

  -- [[ Other ]]
  use("eandrju/cellular-automaton.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
