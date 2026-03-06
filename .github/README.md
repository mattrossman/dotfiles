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
/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME checkout  # Might need to back stuff up first
/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME config --local status.showUntrackedFiles no
chmod +x $HOME/.local/bin/dot
chsh -s $(which zsh)
```
and you're done. Open up `vim` to auto install vim plugins, and run `zsh` to install zinit plugins.

# Making changes

Put cross-shell, non-interactive-safe environment and `PATH` exports in `.zshenv`.
Keep `.zshrc` focused on interactive shell UX (aliases, prompt, plugins, keybinds, completions).

```bash
# ~/.zshenv

export PATH="$HOME/.somefolder:$PATH"
```
