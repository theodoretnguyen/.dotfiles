return {
  { "christoomey/vim-tmux-navigator", enabled = false },
  {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/",
    enabled = true,
  },
}
