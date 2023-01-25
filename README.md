# Config Files

## Fonts

- Fira Mono
- Fira Sans
- FiraCode Nerd Font
- FiraCode Nerd Font Mono
- Hack Nerd Font
- Hack Nerd Font Mono
- MesloLGM Nerd Font
- MesloLGM Nerd Font Mono

## Shell

- oh-my-zsh
- plugins:
  - git
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - web-search
  - macos
- ZSH_THEME: powerlevel10k

## Homebrew Formulae/Casks:

### Terminals

- alacritty
- kitty

### Text Editor

- neovim

### CLI Utilities

- ripgrep
- fd
- fzf
- tree
- tldr

### Tiling Window Manager

- amethyst

### PDF Viewers

- sioyek
- skim
  - config:

    ```
    Sync
      Check for file changes
      Reload automatically
      Preset: Custom
      Command: nvim
      Arguments: --headless -c "VimtexInverseSearch %line '%file'"
    ```

### Other Utilities

- appcleaner
- raycast

### conda

- miniconda
  - config:
    - `conda config --set auto_activate_base false`

### Dev

- git
- mactex-no-gui
- jupyterlab
- r
- gcc
- make
- java
- nvm
	- `npm install —g neovim`
	- `npm install -g markmap-cli`

### Browsers

- brave-browser
- google-chrome

### Socials

- discord
- slack
- zoom

### Music Player

- spotify

### Extras

- neofetch
- asciiquarium
- cmatrix
- toilet
