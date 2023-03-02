return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
      { "j-hui/fidget.nvim", config = true },
    },
    config = function()
      -- [[ Diagnostics ]]
      local sign = function(opts)
        vim.fn.sign_define(opts.name, {
          texthl = opts.name,
          text = opts.text,
          numhl = ""
        })
      end
      sign({ name = "DiagnosticSignError", text = "✘" })
      sign({ name = "DiagnosticSignWarn", text = "▲" })
      sign({ name = "DiagnosticSignHint", text = "⚑" })
      sign({ name = "DiagnosticSignInfo", text = "" })

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = false,
          source = false,
          header = "",
          prefix = "",
        },
      })

      vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

      -- [[ LSP keymaps ]]
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        nmap("<leader>lr", vim.lsp.buf.rename, "Rename")
        nmap("<leader>lc", vim.lsp.buf.code_action, "Code Action")
        nmap("gd", vim.lsp.buf.definition, "Goto Definition")
        nmap("gi", vim.lsp.buf.implementation, "Goto Implementation")
        nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
        -- nmap("n", "gr", vim.lsp.buf.references, "Goto References")
        nmap("go", vim.lsp.buf.type_definition, "Goto Type Definition")
        nmap("<leader>ld", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
        nmap("<leader>lw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")
        nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
        nmap("<leader>li", "<cmd>LspInfo<cr>", "Info")

        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = false }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = false }
        )
      end

      -- [[ LSP servers ]]
      local servers = {
        clangd = {},
        jdtls = {},
        texlab = {},
        marksman = {},
        pyright = {},
        html = {},
        cssls = {},
        tsserver = {},
        quick_lint_js = {},
        psalm = {},
        lua_ls = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }

      -- [[ Capabilities ]]
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- [[ Set up servers ]]
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", enabled = false },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle"  },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics"  },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",  desc = "Quickfix List"  },
    },
    opts = {
      auto_close = true,
      auto_preview = true,
      auto_fold = false,
      use_diagnostic_signs = true,
    },
  }
}
