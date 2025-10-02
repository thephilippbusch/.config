# My .config files repository

This repository includes configurations for the following tools:

- Neovim (-> ./nvim)
- Aerospace (-> ./aerospace)
- Sketchybar (-> ./sketchybar)
- yazi (-> ./yazi)
- tmux (-> ./tmux)

## Tool installation and setup (for MacOS)

### Tmux:

`brew install tmux`

Install dependencies:

`git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`

### Neovim:

`brew install neovim`

> Caveat: Some language servers need language binaries or package manager installed in order to work. The current list of preinstalled tools need *npm* and *go* installed to work properly. My recommendation is to use [proto](https://moonrepo.dev/proto) to manage the installation of those tools

### Aerospace:

`brew install --cask nikitabobko/tap/aerospace`

### Sketchybar:

Install dependencies:

```
brew install font-sf-pro
brew install --cask sf-symbols
```

Install *sketchybar-app-font*:

`curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf`

Install Sketchybar

```
brew tap FelixKratz/formulae
brew install sketchybar
```

### Lazygit:

`brew install lazygit`

### Lazydocker:

`brew install lazydocker`

### Zsh:

First, install all necessary dependencies and tools:

- **Nerd Font:** `brew install font-meslo-lg-nerd-font`
- **Powerlevel10k Theme:** `brew install powerlevel10k`
- **Zsh Autosuggestions:** `brew install zsh-autosuggestions`
- **Zsh syntax highlighting:** `brew install zsh-syntax-highlighting`
- **Eza (better *ls*):** `brew install eza`
- **Zoxide (better *cd*):** `brew install zoxide`
- **Zsh vi mode (*optional*):** `brew install zsh-vi-mode`

Then copy the .zshrc file from this repository to you `$HOME` directory like so:

`cp .zshrc.sample ~/.zshrc`

Finally, run `source ~/.zshrc`. That should open the interactive prompt to create your powerlevel10k theme.

### Yazi (file explorer):

`brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font`

(This command will also install all optional dependencies, more info [here](https://yazi-rs.github.io/docs/installation))

You can then run `y` from any directory inside the terminal and it should start the yazi file explorer
