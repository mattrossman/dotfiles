# Instructions

Install Git, Vim, Zsh, and Antigen. E.g. with Ubuntu:

```bash
sudo apt install git vim zsh zsh-antigen
```


Then run:

```bash
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:mattrossman/dotfiles.git $HOME/.dotfiles
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
df checkout  # Might need to back stuff up first
df config --local status.showUntrackedFiles no
chsh -s $(which zsh)
```
and you're done. Open up `vim` to auto install vim plugins, and run `zsh` to install antigen plugins.
