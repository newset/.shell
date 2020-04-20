#! /bin/bash

export EDITOR=vim

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

export GOPATH=$HOME/Sites/go
export GOROOT=/usr/local/opt/go/libexec
export APOLLO_URL=http://10.10.99.84

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH=/usr/local/opt/python/libexec/bin:$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:$HOME/Development/flutter/bin:/usr/local/Cellar/openvpn/2.4.0/sbin
export PATH=/usr/local/opt/gettext/bin:$PATH:$HOME/.rvm/bin:$GOROOT/bin:~/.fabric8/bin:~/Development/kube/istio-1.3.5/bin

export TAOBAO_NPM_REGISTRY=https://registry.npm.taobao.org
export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/tencent:$HOME/.kube/xinren

# flutter 镜像
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PUB_HOSTED_URL=https://pub.flutter-io.cn

# electron 镜像
export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/

export ADBLOCK=true
export DISABLE_OPENCOLLECTIVE=true

if [ $commands[qshell] ]; then
  source <(qshell completion zsh)
fi