# --- --- ---  ---
# .bashrc master
# --- --- ---  ---

# --- base ---
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# 環境変数
PATH=$PATH:$HOME/bin:.

PS1="[\[\033[32m\]\!\[\033[0m\] \u@\h\[\033[34m\]:\[\033[0m\]\[\033[36m\]\w\[\033[0m\]]$ "

# 履歴の端末間共有設定
function share_history {
    history -a  # 1行追記
    history -c  # 端末localの履歴一旦消去
    history -r  # 履歴再読み込み
}
PROMPT_COMMAND='share_history' #都度実行
shopt -s histappend

# --- alias ---
alias d='dstat -ta'
alias ls='ls -F -G --color'
alias less='less -R'
alias more='less'
alias mroe='less'
alias cp='cp -i'
alias rm='rm -i'
alias ll='ls -al -h | less -RXr'
alias gh='history|grep'
alias watch='watch --differences'
alias nkfo='nkf --overwrite'
alias ex='open .' #OSX
alias psf='ps -e uxf | less -S'
alias sc='screen'
alias top='htop'
# cd 
alias cdb="cd ~/bin"
alias cdd="cd ~/dotfiles"
alias cde="cd ~/develop"
alias cdv="cd ~/.vim"
alias cdc="cd ~/conf"
alias cds="cd ~/share"
alias cdt="cd /tmp"
# bash
alias sb='source ~/.bashrc'
alias eb='vim ~/.bashrc'
alias ebm='vim ~/dotfiles/bash/.bashrc'
alias ebp='vim ~/.bash_profile'
# vim
alias v='vim'
alias vi='vim'
alias ev='vim ~/.vimrc'
alias evm='vim ~/dotfiles/vim/.vimrc'
alias evd='vim ~/.vim/'
alias evf='vim ~/.vim/ftplugin'
alias evt='vim ~/.vim/vimtmp/'
alias es='vim ~/.screenrc'
function vf {
    echo "Refresh vimtmp"
    find ~/.vim/vimtmp/ -regex '^.*[~=]$' -print0 | xargs -0 rm
}
# grep
alias grep='grep --color'

# --- Util関数 ---
function sep { 
    SEP=" "
    [ "$1" = "" ] && SEP="---"
    echo -e "---$SEP$1$SEP---"
}
function x {
    [ "$USER" = "sousu" ] && startx || su -c "startx" sousu
}

# --- Ver管理 ---
# Mercurial
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
# git
alias g="git"
function gth {
    git help $1 | less
}
function gts { 
    sep "summary" && git log -n1
    echo ""
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

# --- pkg管理 ---
# apt
alias a="sudo apt"
function au {  
    sep "update & upgrade" && sudo apt-get update && sudo apt-get upgrade  && \
    sep "autoremove & clean" && sudo apt-get autoremove && sudo apt-get clean
}


