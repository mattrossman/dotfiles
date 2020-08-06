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

# Faster version of the z plugin
antigen bundle agkozak/zsh-z
ZSHZ_UNCOMMON=1 # Improve its selection behavior

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like autosuggestions for zsh
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
