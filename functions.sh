#! /bin/bash
GITLAB=https://git.doctorwork.com
GITHUB=https://github.com

show_func () {
    FILE=$(dirname $0);
}

# 创建并进入目录
mcd () {
    mkdir -p "$@" && cd "$@"
}

# 克隆github项目  user/repo
ghget () {
    # input: rails/rails
    read USERNAME REPO <<< $(echo newset/remax | awk -F / '{print $1, $2}' )
    echo cloning $USERNAME/$REPO
    mcd "$HOME/Sites/source/github.com/$USERNAME" 
    gcl $GITHUB/$@ 
    cd $REPO
}

glget () {
    # input: rails/rails
    read USERNAME REPO <<< $(echo newset/remax | awk -F / '{print $1, $2}' )
    echo cloning $USERNAME/$REPO
    mcd "$HOME/Sites/source/gitlab.com/$USERNAME" 
    gcl $GITLAB/$@ 
    cd $REPO
}

_http_code () {
  local url="$1"
  curl --silent --head \
       --output /dev/null \
       --write-out "%{http_code}\n" \
       "$url"
}

# 解压文件
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unar $1          ;;
            *.Z)              uncompress $1     ;;
            *.7z)             7zr e $1          ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ------------------------------

shell () {
  ps | grep `echo $$` | awk '{ print $4 }'
}

cwd="$(dirname "$0")"
# source $cwd/src/funcs/{search,process}.sh

portslay () {
    kill -9 `lsof -i tcp:$1 | tail -1 | awk '{ print $2;}'`
}

exip () {
    # gather external ip address
    echo -n "Current External IP: "
    curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

ips () {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

# ------------------------------

dls () {
 # directory LS
 echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

dgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    grep -iR "$@" * | grep -v "Binary"
}

dfgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    # and returns only unique filenames
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}

psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

# ----------------------------------

## 批量重命名

act () {

}

## 批量替换目录内制定内容
## 编辑器已包含暂时不实现
## replace src .scss .less


install_yarn () {
    curl -o- -L https://yarnpkg.com/install.sh | bash
}

# kubernetes
# -------------------------------

# install weave scope
install_weave_scope () {
    kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
}

proxy_weave_scope () {
    kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040
}

# git
# -------------------------------

# update git to https
use_git_https () {
    
}

check_pr () {
    curl -L http://github.com/$1/pull/$2.patch | git am
}