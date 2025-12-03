# Copy all configuration from .bashrc
[[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'

source $HOME/.zsh/autosuggest.zsh

ANTIGEN="$HOME/antigen.zsh"
if [ ! -f "$ANTIGEN" ]; then
	echo "Downloading Antigen to ${ANTIGEN}..."
	curl -L git.io/antigen > $ANTIGEN
fi

source $ANTIGEN

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle git
antigen bundle git-fast

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like autosuggestions for zsh
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply


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
eval "$(zoxide init zsh)"
