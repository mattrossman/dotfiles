# Copy all configuration from .bashrc
[[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'

ANTIGEN="$HOME/antigen.zsh"
if [ ! -f "$ANTIGEN" ]; then
	echo "Downloading Antigen to ${ANTIGEN}..."
	curl -L git.io/antigen > $ANTIGEN
fi

source $ANTIGEN

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
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
