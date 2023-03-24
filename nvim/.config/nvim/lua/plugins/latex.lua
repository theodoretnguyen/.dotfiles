return {
  "lervag/vimtex",
  ft = { "tex", "latex" },
  config = function()
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_syntax_conceal_disable = 0
    vim.g.vimtex_delim_toggle_mod_list = {
      { "\\left", "\\right" },
      { "\\big", "\\big" }
    }

    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull \\hbox",
      "Overfull \\hbox",
      "Underfull \\vbox",
      "Overfull \\vbox",
    }

    -- [[ PDF ]]

    -- [[ Skim ]]
    -- vim.g.vimtex_view_method = "skim"
    -- vim.g.vimtex_view_skim_activate = 1
    -- vim.g.vimtex_view_skim_sync = 0
    -- vim.g.vimtex_view_skim_reading_bar = 1

    -- [[ Sioyek ]]
    vim.g.vimtex_view_method = "sioyek"

    -- Return focus to Nvim after inverse search on macOS
    -- vim.cmd([[
    -- function! s:TexFocusVim() abort
    -- silent execute "!open -a kitty"
    -- redraw!
    -- endfunction
    -- augroup vimtex_event_focus
    -- au!
    -- au User VimtexEventViewReverse call s:TexFocusVim()
    -- augroup END
    -- ]])

    vim.g.maplocalleader = "\\"
    vim.g.vimtex_mappings_enabled = 1
    vim.g.vimtex_imaps_enabled = 0
  end,
}
