# --- --- ---  ---
# .bashrc master
# --- --- ---  ---

# --- base ---
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# 環境変数
PATH=$PATH:$HOME/bin:.

# pronpt 
# - ( \033k\033\\ ) はscreen関係の設定

# PS1="\033k\033\\ \u:\w\[\033[30m\]:$ \[\e[0m\]" 
# PS1="\`if [ \$? = 0 ];then echo \"\[\e[36m\]\!\[\e[0m\]\"; \
#     else echo \"\[\e[33m\]\!\[\e[0m\]\";fi\`\033k\033\\ \u:\w\[\033[34m\]:$ \[\e[0m\]"
PS1="[\[\033[32m\]\!\[\033[0m\] \u@\h\[\033[34m\]:\[\033[0m\]\[\033[36m\]\w\[\033[0m\]]$ "

# history端末間共有のための設定
function share_history {
    history -a  # 1行追記
    history -c  # 端末localの履歴を一旦消去
    history -r  # 履歴再読み込み
}
PROMPT_COMMAND='share_history' # 毎度実行
shopt -s histappend

# --- alias ---
# 基本設定
alias less='less -R'
alias more='less'
alias mroe='less'
alias rm='rm -i'
alias cp='cp -i'
alias rm='rm -i'
alias ll='ls -al -h | less -RXr'
alias emacs='emacs -nw'
alias gh='history|grep'
alias watch='watch --differences'
alias nkfo='nkf --overwrite'
alias nkfg='nkf --guess'
alias ex='open .' # for OSX
alias psf='ps -e uxf | less -S'
#alias sc='screen -r sousu || screen -S sousu'
alias sc='screen'
alias top='htop'
# cd 
alias cdb="cd ~/bin"
alias cdd="cd ~/dotfiles"
alias cde="cd ~/develop"
alias cdv="cd ~/.vim"
alias cdc="cd ~/conf"
alias cdvimp="cd ~/.vimperator"
alias cds="cd ~/share"
alias cdr="cd ~/Dropbox"
alias cdm="cd ~/Dropbox/memo"
alias cdt="cd /tmp"
alias cdn="cd ~/Dropbox/tools/blog"
# Bash
alias sb='source ~/.bashrc'
alias ebm='vim ~/dotfiles/bash/.bashrc'
alias ebp='vim ~/.bash_profile'
# Vim
alias v='vim'
alias vi='vim'
alias svim='sudo vim'
alias eb='vim ~/.bashrc'
alias ev='vim ~/.vimrc'
alias evm='vim ~/dotfiles/vim/.vimrc'
alias evd='vim ~/.vim/'
alias evf='vim ~/.vim/ftplugin'
alias evt='vim ~/.vim/vimtmp/'
alias vir='vim ./*.rb'
alias vic='vim ./*.conf'
alias es='vim ~/.screenrc'
alias vp='vim -c"call Vimpress()"'
function vrefresh {
    find ~/.vim/vimtmp/ -regex '^.*[~=]$' -print0 | xargs -0 rm
}
function md { 
    _date=`date +"%y%m%d"`
    _prefix="$_date - "
    _ext='.txt'
    _tmpl="<!-- vim: set ft=markdown: -->"
    echo -e "\n\n\n$_tmpl" > "$_prefix$1$_ext"
    vim "$_prefix$1$_ext"
}
# Vimperator
alias evimp='vim ~/.vimperatorrc'
alias evimpm='vim ~/dotfiles/vimperator/.vimperatorrc'
alias evimpd='vim ~/.vimperator/'
# screen
alias es='vim ~/.screenrc'
# grep
alias grep='grep --color'
# DropBox
alias cdD='cd ~/Dropbox'
alias vm='vim ~/Dropbox/memo/'

# --- Util func ---
function sep { 
    SEP=" "
    [ "$1" = "" ] && SEP="---"
    echo -e "---$SEP$1$SEP--------------"
}
function x {
    [ "$USER" = "sousu" ] && startx || su -c "startx" sousu
}

# --- Ver管理 ---
# Mercurial(hg)
function hgh {
    hg help -v $1 | less
}
function hgs {
    sep "summary" && hg summary
    sep "log    " && hg log -l3 -G
    sep "status " && hg status
    echo ""
}
function hgu {
    sep "pull & update" && hg pull && echo "--" && hg update
}
function hgp {
    hg push
}
function hgd {
    hg diff $* | colordiff | less
}
alias hgc="hg commit -usousu"
alias hga="hg add"
alias hgr="hg revert"
# Git
alias g="git"
function gth {
    git help $1 | less
}
function gts { 
    sep "summary" && git log -n1
    sep "log    " && git log --graph --pretty='format:%C(yellow)%h%Cblue%d%Creset %s %C(black bold)%an, %ar%Creset' | head -n10
    echo ""
    sep "status " && git status -s
    echo ""
}
alias gtd="git diff --color-words"
alias gta="git add"
alias gtu="git pull"
alias gtc="git commit -a"
alias gtp="git push origin"
alias gtr="git rm --cached"
alias gtR="git rm"

# --- Ver管理(release) ---
# function release_bash {
# }

# --- パッケージ管理 ---
# mac-ports 
port-v(){ pushd /opt/svn/dports && sudo svn cleanup && sudo svn update && popd ;}
port-u(){ sudo port -d sync && sudo port upgrade outdated && sudo port -u uninstall ;}
port-U(){ port-v && port-u ;}
port-i(){ sudo port -d install $* ;}
port-I(){ sudo port -d installed | less ;}
port-s(){ sudo port search $* | less ;}
port-g(){ sudo port -d upgrade $* ;}
port-r(){ sudo port -d uninstall $* ;}
port-l(){ sudo port list | less ;}
port-V(){ sudo port variants $* ;}
# porg
alias porg_install='porg -lD make install'
alias porg_list='porg -adsF'
porg_del(){ porg -r "`basename $(pwd)`" ;}
porg_reinstall(){ porg -r "`basename $(pwd)`" && porg -lD make install ;}
# yum
alias yum-i="yum install"
alias yum-s="yum search"
alias yum-p="yum provides"
alias yum-r="yum remove"
alias yum-l="yum list"
alias yum-L="yum list installed | less"
alias yumdag-l="yum --enablerepo=dag list"
alias yumdag-s="yum --enablerepo=dag search"
alias yumdag-i="yum --enablerepo=dag install"
# apt
apt-ar(){ sudo apt-get autoremove $1 ;}
apt-r(){  sudo apt-get remove $1 ;}
apt-ug(){ sudo apt-get upgrade ;}
apt-ud(){ sudo apt-get update ;}
apt-t(){  sudo apt-get update     && sudo apt-get upgrade  && \
          sudo apt-get autoremove && sudo apt-get clean ;}
apt-i(){  sudo apt-get install $1  ;}
apt-s(){  sudo apt-cache search $1 | grep $1 ;}
apt-sh(){ sudo apt-cache show $1 | less ;}


