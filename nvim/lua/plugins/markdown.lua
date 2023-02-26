return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>mP", "<cmd>MarkdownPreviewToggle<cr>", desc = "Preview" },
    },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ""
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ""
      vim.cmd([[
      let g:mkdp_preview_options = {
        \ "mkit": {},
        \ "katex": {},
        \ "uml": {},
        \ "maid": {},
        \ "disable_sync_scroll": 0,
        \ "sync_scroll_type": 'middle',
        \ "hide_yaml_meta": 1,
        \ "sequence_diagrams": {},
        \ "flowchart_diagrams": {},
        \ "content_editable": v:false,
        \ "disable_filename": 0,
        \ "toc": {}
        \ }
        ]])
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      vim.g.mkdp_port = ""
      vim.g.mkdp_page_title = "${name}"
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
    end,
  },
  {
    "NFrid/markdown-togglecheck",
    dependencies = { "NFrid/treesitter-utils" },
    ft = { "markdown" },
    keys = {
      { "<leader>mm", "<cmd>lua require('markdown-togglecheck').toggle<cr>", desc = "Check/Uncheck"  },
      { "<leader>mM", "<cmd>lua require('markdown-togglecheck').toggle_box<cr>", desc = "Box/Unbox" },
    },
    opts = {
      create = true,
      remove = false,
    },
  },
}
