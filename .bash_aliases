# Common Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias goh='cd /home/sporty/go/src/bitbucket.org/tsitnikov'                            
alias chatt='ssh tim@192.168.251.30'                                            

# Staging Machine login
alias st="ssh receiver@mueller.23stages.com"

# Debud
alias uart="picocom -b 115200 --imap crcrlf /dev/ttyUSB0"

alias fw="cd ~/ws-ccs/hw_1_5"
alias demo="cd ~/demo"
alias isrs="cd ~/work/c1202-srs-web_app/ && nvim SystemInterfaceV2.md"
alias hw="cd ~/cs6340/hw8/constraints"

alias us="ssh -X -l sporty -p 2222 localhost"
alias subs="VBoxManage startvm Arch --type headless"
alias pico="picocom -b 115200 --imap crcrlf /dev/ttyUSB0"

#=============[ Disable / Enable touch pad ]==================================
alias tpoff='synclient TouchpadOff=1'
alias tpon='synclient TouchpadOff=0'

alias weather='curl http://wttr.in/chattanooga'

