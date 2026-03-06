case ":$PATH:" in
  *":$HOME/.local/share/mise/shims:"*) ;;
  *) PATH="$HOME/.local/share/mise/shims:$PATH" ;;
esac

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) PATH="$HOME/.local/bin:$PATH" ;;
esac

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) PATH="$PNPM_HOME:$PATH" ;;
esac

export BUN_INSTALL="$HOME/.bun"
case ":$PATH:" in
  *":$BUN_INSTALL/bin:"*) ;;
  *) PATH="$BUN_INSTALL/bin:$PATH" ;;
esac

case ":$PATH:" in
  *":$HOME/.lmstudio/bin:"*) ;;
  *) PATH="$PATH:$HOME/.lmstudio/bin" ;;
esac

export PATH

if [ -f "$HOME/.config/opencode/opencode.local.jsonc" ]; then
  export OPENCODE_CONFIG="$HOME/.config/opencode/opencode.local.jsonc"
fi
