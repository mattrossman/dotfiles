# Setup

## Ubuntu

(optional) Add Git PPA for latest stable release

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
```

Install packages

```bash
sudo apt install git vim zsh build-essential
```

Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install brew packages

```bash
brew install zinit zoxide
```

## MacOS

Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install packages

```bash
brew install git vim zsh zinit gh zoxide
```

(optional) Install casks

```bash
brew install --cask google-chrome iterm visual-studio-code raycast rectangle bartender cleanshot spotify
```

## Shared

Backup any boilerplate `.bashrc` as needed, and run:

```bash
cd
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:mattrossman/dotfiles.git $HOME/.dotfiles.git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dotfiles checkout  # Might need to back stuff up first
dotfiles config --local status.showUntrackedFiles no
chsh -s $(which zsh)
```
and you're done. Open up `vim` to auto install vim plugins, and run `zsh` to install zinit plugins.

# Making changes

`PATH` modifications go in `.bash_profile` which is sourced from `.bashrc` and by extension `.zshrc`.

```bash
# ~/.bash_profile

export PATH="$HOME/.somefolder:$PATH"
```
