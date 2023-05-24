# .dotfiles
A repository containing the dotfiles I use

## Getting Started

### Prerequisites

- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms)
- [GNU stow](https://www.gnu.org/software/stow/)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k#installation)
- [alacritty](https://github.com/alacritty/alacritty) (optional)
- [fzf](https://github.com/junegunn/fzf)
- [neovim](https://github.com/neovim/neovim) (optional)
- [tmux](https://github.com/tmux/tmux) (optional)

### Installation

Clone this repository within your home directory

```sh
cd $HOME
git clone https://github.com/achyuta116/.dotfiles
```

Run the install script via your shell

```sh
cd .dotfiles
zsh install
```

Or alternatively stow the required config files manually

```sh
stow nvim alacritty #... The directory names of the configs you'd like to use
```

## Features

- The base Neovim configuration is taken from Chris@Machine's YT series - [Neovim from Scratch](https://youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
- zsh uses OhMyZsh and powerlevel10k
- Colorscheme - [Kanagawa Dragon](https://github.com/rebelot/kanagawa.nvim)
- tmux configuration heavily inspired by [ThePrimeagen](https://www.youtube.com/@ThePrimeagen)
- tmux-sessionizer - a tmux Navigation Bash Script built from [Developer Productivity](https://frontendmasters.com/courses/developer-productivity/) FrontendMasters course taken by ThePrimeagen
> **Note**
> The script works within a regular terminal session, within tmux sessions and within neovim running in tmux sessions

> **Warning**
> You cannot be within a regular terminal window running neovim to use this script
- The alacritty configuration uses the [Cascadia Code NF](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode) installed from [NerdFont Downloads](https://www.nerdfonts.com/font-downloads)
