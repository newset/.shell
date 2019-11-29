#! /bin/bash

export EDITOR=vim

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

export GOPATH=$HOME/Sites/go
export GOROOT=/usr/local/opt/go/libexec
export APOLLO_URL=http://172.16.4.7:8080

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH=/usr/local/opt/python/libexec/bin:$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=/usr/local/opt/gettext/bin:$PATH:$HOME/.rvm/bin:$GOROOT/bin:~/.fabric8/bin:~/Development/kube/istio-1.3.5/bin

export TAOBAO_NPM_REGISTRY=https://registry.npm.taobao.org