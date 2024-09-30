eval $(/opt/homebrew/bin/brew shellenv)

# pnpm
export PNPM_HOME="/Users/jpistor/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm endeval $(/opt/homebrew/bin/brew shellenv)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
