export PGUSER=jpistor
export PGPORT=5415
export NVIM_APPNAME=astronvim4

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/usr/sbin:$PATH"
. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
