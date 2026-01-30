# Copy all configuration from .bashrc
[[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'

# Zinit (via Homebrew)
source $(brew --prefix)/opt/zinit/zinit.zsh

# OMZ libs + theme
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZT::robbyrussell

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Autosuggestions config
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Enable vim line editing with <C-x><C-e>
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# pnpm
export PNPM_HOME="/Users/matt/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/matt/.bun/_bun" ] && source "/Users/matt/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/matt/.lmstudio/bin"
# End of LM Studio CLI section

# Setup zoxide
# https://github.com/ajeetdsouza/zoxide
# Skip zoxide initialization in Cursor Agent sessions (sandbox can't write to database)
if [[ -z "$CURSOR_AGENT" ]]; then
  eval "$(zoxide init zsh)"
fi

