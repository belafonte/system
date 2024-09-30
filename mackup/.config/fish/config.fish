if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PGUSER jpistor
set -x PGPORT 5415
# set -x TERM xterm-256color
# This is needed, htat clojure uses .config folder instead of home dir
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

set -x CARGO_HOME $XDG_CACHE_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

set -x DYLD_LIBRARY_PATH (brew --prefix)/lib
set -gx GPG_TTY (tty)


fish_vi_key_bindings

# aliases
alias lll='eza --all --icons -l'
alias llg='eza --all --icons -l --grid'
alias llt='eza -TL 2'
alias launch-windows="launch_kitty_windows"
alias oldastro="NVIM_APPNAME=astrovim nvim"
alias lazy="NVIM_APPNAME=lazyvim nvim"
alias neo="NVIM_APPNAME=astronvim4 nvim"
alias cdt="cd -"
alias kssh="kitty +kitten ssh"
alias crepl="clj -Sdeps '{:deps {nrepl/nrepl {:mvn/version \"1.0.0\"} cider/cider-nrepl {:mvn/version \"0.42.1\"}}}' \
    --main nrepl.cmdline \
    --middleware '[\"cider.nrepl/cider-middleware\"]' \
    --interactive"

alias tp="tmux new -A -s (pwd | sed 's/.*\///g')"




# abbreviations
 # abbr --add cdc cd ~/Documents/Code
abbr tn "tmux new -A -s (pwd | sed 's/.*\///g')"
# abbr tn4 "tmux new -A -s (pwd | sed 's/.*\///g') \; \split-window -v \; \split-window -h \; \select-pane -t 1 \; \split-window -h"
abbr su 'env TERM=xterm-256color su'
abbr ssh 'env TERM=xterm-256color ssh'

### leihs specific
abbr dbdev 'DB_NAME=leihs_dev'
abbr dbtest 'DB_NAME=leihs_test'
abbr rrs "DB_NAME=leihs_test ./bin/rspec "


function tn3
    set session_name (pwd | sed 's/.*\///g')
    if tmux has-session -t $session_name 2>/dev/null
        tmux attach -t $session_name
    else
        tmux new -s $session_name \; \
        split-window -h \; \
        split-window -v \; \
        select-pane -t 1
    end
end

function tn4
    set session_name (pwd | sed 's/.*\///g')
    if tmux has-session -t $session_name 2>/dev/null
        tmux attach -t $session_name
    else
        tmux new -s $session_name \; \
        split-window -v \; \
        split-window -h \; \
        select-pane -t 1 \; \
        split-window -h \; \
        select-pane -t 1
    end
end

function tmux-git
    set repo_name (git rev-parse --show-toplevel 2> /dev/null)
    if test -n "$repo_name"
        set base_name (basename $repo_name)
        tmux new-session -A -s $base_name
    else
        echo "Not in a Git repository"
    end
end

function launch_kitty_windows
    set cwd (pwd)
    
    kitty @ launch --cwd=$cwd
    sleep 0.5
    kitty @ launch --cwd=$cwd
end


source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Add directories to PATH if they exist
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/bin
fish_add_path ~/.cache/cargo/bin
fish_add_path /opt/homebrew/opt/postgresql@15/bin

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


starship init fish | source
thefuck --alias | source
zoxide init fish | source
