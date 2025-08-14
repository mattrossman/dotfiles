# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash"
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

mmkdir() {
	mkdir $1 && cd $1
}

yad() {
	yarn add -D "$@"
}

if grep -s -i microsoft /proc/version; then
	# WSL specific items
	alias open=explorer.exe
fi

# Untracked config goes in .bash_profile
if [ -f ~/.bash_profile ]; then
	    . ~/.bash_profile
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# https://moonrepo.dev/docs/proto/workflows
export PATH="$HOME/.proto/shims:$PATH"
export PATH="$HOME/.proto/bin:$PATH"
export PATH="$HOME/.proto/tools/node/globals/bin:$PATH"

# https://mise.jdx.dev/cli/activate.html#mise-activate
eval "$(mise activate bash)"

[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"


[[ -f "$HOME/fig-export/dotfiles/dotfile.bash" ]] && source "$HOME/fig-export/dotfiles/dotfile.bash"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash"
