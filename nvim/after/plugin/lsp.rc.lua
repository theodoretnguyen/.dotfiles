local found, lspconfig = pcall(require, 'lspconfig')
if (not found) then return end

require('lspsaga').setup({
  scroll_preview = {
    scroll_down = '<c-d>',
    scroll_up = '<c-u>',
  },
  code_action = {
    show_server_name = false,
  },
  lightbulb = {
    virtual_text = false,
  },
  diagnostic = {
    on_insert = false,
    show_code_action = false,
    show_source = false,
  },
  rename = {
    quit = "<esc>",
  },
  symbol_in_winbar = {
    enable = false,
  },
  ui = {
    border = "rounded",
  }
})

local function lsp_keymaps(bufnr)
  local map = function(m, lhs, rhs, dsc)
    local opts = { remap = false, silent = true, buffer = bufnr, desc = dsc }
    vim.keymap.set(m, lhs, rhs, opts)
  end

  -- LSP actions
  -- map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
  -- map('n', 'gd', vim.lsp.buf.definition, 'Goto Definition')
  -- map('n', 'gD', vim.lsp.buf.declaration, 'Goto Declaration')
  -- map('n', 'gi', vim.lsp.buf.implementation, 'Goto Implementation')
  -- map('n', 'go', vim.lsp.buf.type_definition, 'Goto Type Definition')
  -- map('n', 'gr', vim.lsp.buf.references, 'Goto References')
  -- map('n', '<leader>lr', vim.lsp.buf.rename, 'Rename')
  -- map('n', '<leader>la', vim.lsp.buf.code_action, 'Code Action')
  -- map('x', '<leader>la', vim.lsp.buf.range_code_action, 'Range Code Action')
  map('n', '<leader>li', '<cmd>LspInfo<cr>', 'Info')

  -- Diagnostics
  -- map('n', 'gl', vim.diagnostic.open_float, 'Show Diagnostic')
  -- map('n', '[d', vim.diagnostic.goto_prev, 'Prev Diagnostic')
  -- map('n', ']d', vim.diagnostic.goto_next, 'Next Diagnostic')

  -- LSP Saga
  map('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>')
  map({ 'n', 'v' }, 'ga', '<cmd>Lspsaga code_action<cr>')
  map('n', 'gr', '<cmd>Lspsaga rename<cr>')
  map('n', 'gR', '<cmd>Lspsaga rename ++project<cr>')
  map('n', 'gd', '<cmd>Lspsaga peek_definition<cr>')
  map('n', 'gD', '<cmd>Lspsaga goto_definition<cr>')
  map('n', 'gt', '<cmd>Lspsaga peek_type_definition<cr>')
  map('n', 'gT', '<cmd>Lspsaga goto_type_definition<cr>')
  map('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>')
  map('n', 'gL', '<cmd>Lspsaga show_buf_diagnostics<cr>')
  map('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
  map('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
  map('n', 'go', '<cmd>Lspsaga outline<cr>')
  map('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
end

local function lsp_settings()
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({ name = 'DiagnosticSignError', text = '✘' })
  sign({ name = 'DiagnosticSignWarn', text = '▲' })
  sign({ name = 'DiagnosticSignHint', text = '⚑' })
  sign({ name = 'DiagnosticSignInfo', text = '' })

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = false,
      header = '',
      prefix = '',
    },
  })

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
  )

  local command = vim.api.nvim_create_user_command

  command('LspWorkspaceAdd', function()
    vim.lsp.buf.add_workspace_folder()
  end, { desc = 'Add folder to workspace' })

  command('LspWorkspaceList', function()
    vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = 'List workspace folders' })

  command('LspWorkspaceRemove', function()
    vim.lsp.buf.remove_workspace_folder()
  end, { desc = 'Remove folder from workspace' })
end

local function lsp_attach(_, bufnr)
  local buf_command = vim.api.nvim_buf_create_user_command

  lsp_keymaps(bufnr)

  buf_command(bufnr, 'LspFormat', function()
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format buffer with LSP' })

	-- local buf_autocmd = vim.api.nvim_create_autocmd
  -- buf_autocmd('CursorHold', {
  --   buffer = bufnr,
  --   callback = function()
  --     local opts = {
  --       focusable = false,
  --       close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
  --       border = 'rounded',
  --       source = false,
  --       prefix = '',
  --       scope = 'cursor',
  --     }
  --     vim.diagnostic.open_float(nil, opts)
  --   end,
  -- })
end

lsp_settings()

require("fidget").setup({})
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "jdtls",
    "clangd",
    "texlab",
    "marksman",
    "pyright",
    "html",
    "cssls",
    "tsserver",
    "psalm",
  }
})

local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    on_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  })
end

lspconfig["lua_ls"].setup({
  on_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        -- path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
})
