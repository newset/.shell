#! /bin/bash

# alias
#
alias src="source ~/.zshrc"
alias cpwd='pwd|tr -d "\n"|pbcopy'
alias tmux="tmux new -A -s miaotai"
alias dc='docker-compose'
alias ping='ping -c 5'

alias startvpn='sudo openvpn --daemon --cd /etc/openvpn/config --config client.ovpn --log-append /var/log/openvpn.log'
alias www='python -m http.server 8080'
alias svim='sudo vim'


alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"