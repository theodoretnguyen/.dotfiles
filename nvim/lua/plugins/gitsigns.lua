return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end
      -- Navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map("n", "<leader>Gs", "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk")
      map("n", "<leader>Gu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>Gr", "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>Gp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>GS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>GR", gs.reset_buffer, "Reset Buffer")
      -- Blame line
      map("n", "<leader>Gb", function()
        gs.blame_line({ full = true })
      end, "Blame Line")
      -- Diff
      map("n", "<leader>Gd", gs.diffthis, "Diff This")
      map("n", "<leader>GD", function()
        gs.diffthis("~")
      end, "Diff This ~")
      -- Text object
      map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
  },
}
