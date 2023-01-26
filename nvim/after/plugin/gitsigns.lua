-- [[ Imports ]]
local gitsigns_setup, gitsigns = pcall(require, "gitsigns")
if not gitsigns_setup then
  return
end

gitsigns.setup({
  -- [[ Configuration ]]
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "win",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },

  -- [[ Keymaps ]]
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
    end

    -- Navigation
    map("n", "]h", gs.next_hunk, "Next Hunk")
    map("n", "[h", gs.prev_hunk, "Prev Hunk")

    map({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk")
    map({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk")

    map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
    map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
    map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")

    -- Blame line
    map("n", "<leader>gb", function()
      gs.blame_line({ full = true })
    end, "Blame Line")

    -- Diff
    map("n", "<leader>gd", gs.diffthis, "Diff This")
    map("n", "<leader>gD", function()
      gs.diffthis("~")
    end, "Diff This ~")

    -- Text object
    map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
  end,
})
