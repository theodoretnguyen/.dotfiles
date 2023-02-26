return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
