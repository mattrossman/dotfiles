# Copy all configuration from .bashrc
[[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'

# Zinit loader (portable across Homebrew and XDG install paths)
if (( ! $+functions[zinit] )); then
  if (( $+commands[brew] )); then
    HOMEBREW_PREFIX="$(brew --prefix 2>/dev/null)"
    if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/opt/zinit/zinit.zsh" ]]; then
      source "$HOMEBREW_PREFIX/opt/zinit/zinit.zsh"
    fi
  fi

  ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
  if [[ -f "$ZINIT_HOME/zinit.zsh" ]]; then
    source "$ZINIT_HOME/zinit.zsh"
  fi
fi

# OMZ libs + theme
if (( $+functions[zinit] )); then
  zinit snippet OMZL::functions.zsh
  zinit snippet OMZL::async_prompt.zsh
  zinit snippet OMZL::git.zsh
  zinit snippet OMZL::theme-and-appearance.zsh
  zinit snippet OMZT::robbyrussell

  # Plugins
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-syntax-highlighting
fi

# Autosuggestions config
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Enable vim line editing with <C-x><C-e>
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Setup zoxide
# https://github.com/ajeetdsouza/zoxide
# Skip zoxide initialization in Cursor Agent sessions (sandbox can't write to database)
if [[ -z "$CURSOR_AGENT" ]]; then
  (( $+aliases[zi] )) && unalias zi
  eval "$(zoxide init zsh)"
fi

# https://mise.jdx.dev/cli/activate.html#mise-activate
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi
