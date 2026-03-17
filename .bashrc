alias y=yarn
alias p=pnpm
alias b=bun
alias ip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias c=cargo
alias today="date '+%Y-%m-%d'"
alias iterm="open -a iTerm $*"
alias c=cursor
alias g=git
alias o=opencode
alias init-agents='touch AGENTS.md && ln -s AGENTS.md CLAUDE.md'

mmkdir() {
	mkdir $1 && cd $1
}

mkproj() {
  local dir="${1:+$(today)_$1}"
  dir="${dir:-$(today)}"
  mkdir "$dir"
}

mmkproj() {
  local dir="${1:+$(today)_$1}"
  dir="${dir:-$(today)}"
  mkdir "$dir" && cd "$dir"
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
