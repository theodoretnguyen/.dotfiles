# Dotfiles

![dotfiles image](./dotfiles.png)

## Installing

You will need `git` and GNU `stow`

Clone into your `$HOME` directory or `~`

```zsh
git clone https://git@github.com:theodoretnguyen/.dotfiles.git ~
```

Run `stow` to symlink everything or just select what you want

```zsh
stow */ # Everything
```

## Homebrew Formulae

An updated list of all the programs I use can be found in `Brewfile`

```zsh
cd ~/.dotfiles && brew bundle install
```
