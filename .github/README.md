# Setup

Commands written for Ubuntu based systems.

(optional) Add Git PPA for latest stable release

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
```

Install Git, Vim, Zsh, and Antigen

```bash
sudo apt install git vim zsh zsh-antigen
```


Bakcup any boilerplate `.bashrc` as needed, and run:

```bash
cd
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:mattrossman/dotfiles.git $HOME/.dotfiles.git
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
df checkout  # Might need to back stuff up first
df config --local status.showUntrackedFiles no
chsh -s $(which zsh)
```
and you're done. Open up `vim` to auto install vim plugins, and run `zsh` to install antigen plugins.

# Making changes

`PATH` modifications go in `.bash_profile` which is sourced from `.bashrc` and by extension `.zshrc`.

```bash
PATH=$HOME/.somefolder:$PATH
```
