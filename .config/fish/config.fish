set -U EDITOR nvim

function fish_prompt
    set_color normal
    echo (pwd)'~> '
end

set -U fish_user_paths ~/MSPFlasher/ $fish_user_paths
set -g -x GOPATH ~/go
set -g -x PATH $GOPATH /opt/cxoffice/bin $PATH


