# fish_vi_mode

set -U EDITOR nvim

function fish_prompt
    set_color normal
    echo (pwd)'~> '
end

set -g -x HOME /home/sporty
set -U fish_user_paths ~/MSPFlasher/ $fish_user_paths
set -g -x GOPATH ~/go
set -g -x PATH $GOPATH /opt/cxoffice/bin $HOME/.rbenv/bin $PATH

status --is-interactive; and source (rbenv init -|psub)

set fish_key_bindings fish_user_key_bindings


