-- [[ Imports ]]
local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
  return
end
local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then
  return
end
local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then
  return
end
local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_setup then
  return
end

local mason_null_ls_setup, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_setup then
  return
end
local null_ls_setup, null_ls = pcall(require, "null-ls")
if not null_ls_setup then
  return
end

local telescope_setup, _ = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- [[ Diagnostics ]]
-- Keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, desc = "Prev Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, desc = "Next Diagnostic" })
vim.keymap.set("n", "gs", vim.diagnostic.open_float, { silent = true, desc = "Show Diagnostic" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, { silent = true, desc = "Quickfix" })
vim.keymap.set("n", "<leader>cq", "<cmd>cwindow<cr>", { silent = true, desc = "Quickfix" })
vim.keymap.set("n", "[q", "<cmd>cp<cr>", { silent = true, desc = "Prev Quickfix Entry" })
vim.keymap.set("n", "]q", "<cmd>cn<cr>", { silent = true, desc = "Next Quickfix Entry" })

-- UI
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})


-- [[ Keymaps (on_attach) and Autocompletion (capabilities) ]]
-- Enable keybinds only when LSP server connects to a buffer
local on_attach = function(_, bufnr)
  -- Helper function to set mode, buffer, and description
  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, silent = true })
  end

  nmap("<leader>lr", vim.lsp.buf.rename, "Rename")
  nmap("<leader>la", vim.lsp.buf.code_action, "Code Action")

  nmap("gd", vim.lsp.buf.definition, "Goto Definition")
  nmap("gi", vim.lsp.buf.implementation, "Goto Implementation")
  nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
  nmap("<leader>ld", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
  nmap("<leader>lw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-K>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
  nmap("<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
  -- nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  -- nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  -- nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  --[[ nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders") ]]

  -- Show line diagnostics automatically in hover window
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "single",
        source = false,
        prefix = "",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = "Format current buffer with LSP" })
  nmap("<leader>lf", "<cmd>Format<cr>", "Format")
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- [[ Mason ]]
-- Set up mason so it can manage external tooling
mason.setup()

-- Enable the following language servers
local servers = {
  "lua_ls",
  "clangd",
  "texlab",
  "jdtls",
  "marksman",
  "html",
  "cssls",
  "tsserver",
  "psalm",
}

-- Ensure the servers above are installed
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Turn on status information
require("fidget").setup({})

-- [[ LSP Configuration ]]

-- [[ Lua ]]
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig["lua_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
})

-- [[ Formatters and Linters Configuration ]]
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Enable the following formatters and linters
local formatters_linters = {
  -- [[ Formatters ]]
  "stylua",
  -- "prettier",
  -- "clang_format",
  -- [[ Linters ]]
  -- "eslint_d",
  -- "cpplint",
  -- "markdownlint",
}

-- Ensure the formatters and linters above are installed
mason_null_ls.setup({
  ensure_installed = formatters_linters,
  automatic_installation = true,
})

-- Source the formatters and linters
null_ls.setup({
  sources = {
    -- [[ Formatters ]]
    -- formatting.clang_format,
    formatting.stylua,
    -- formatting.prettier,
    -- [[ Diagnostics ]]
    -- diagnostics.eslint_d.with({
    --   condition = function(utils)
    --     return utils.root_has_file(".eslintrc.js")
    --   end,
    -- }),
    -- diagnostics.cpplint,
    -- diagnostics.markdownlint,

  },
})
