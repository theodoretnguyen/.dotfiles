-- [[ Imports ]]
local setup, gitsigns = pcall(require, "gitsigns")
if (not setup) then return end

gitsigns.setup({
  -- [[ Keymaps ]]
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    -- Navigation
    map("n", "]h", gs.next_hunk, "Next Hunk")
    map("n", "[h", gs.prev_hunk, "Prev Hunk")

    map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk")
    map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
    map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk")
    map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")

    map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")

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
