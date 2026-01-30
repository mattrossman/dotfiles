alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias dot=dotfiles
alias y=yarn
alias p=pnpm
alias b=bun
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias c=cargo
alias today="date '+%Y-%m-%d'"
alias iterm="open -a iTerm $*"
alias c=cursor
alias g=git

mmkdir() {
	mkdir $1 && cd $1
}

mkproj() {
  if [ -z "$1" ]; then
    echo "Usage: mkproj <name>"
    return 1
  fi

  mkdir "$(today)_$1"
}

mmkproj() {
  if [ -z "$1" ]; then
    echo "Usage: mmkproj <name>"
    return 1
  fi

  mkdir "$(today)_$1" && cd "$(today)_$1"
}

if grep -s -i microsoft /proc/version; then
	# WSL specific items
	alias open=explorer.exe
fi

# Untracked config goes in .bash_profile
if [ -f ~/.bash_profile ]; then
	    . ~/.bash_profile
fi

# https://mise.jdx.dev/cli/activate.html#mise-activate
eval "$(mise activate bash)"

[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/matt/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"
