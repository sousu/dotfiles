# --- --- ---  ---
# .bashrc master
# --- --- ---  ---

# --- confirm ---
\echo "---"
\w
\echo ""
#\df -Th | sed -e '1d' | grep -v "100%"
#\echo ""

# --- backup ---
\cp -f ~/.bash_history ~/.bash_history_save

# --- base ---
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Β«Ο
PATH=$PATH:$HOME/bin:.

PS1="[\[\033[32m\]\!\[\033[0m\] \u@\h\[\033[34m\]:\[\033[0m\]\[\033[36m\]\w\[\033[0m\]]$ "

# πΜ[Τ€Lέθ
function share_history {
    history -a  # 1sΗL
    history -c  # [localΜπκUΑ
    history -r  # πΔΗέέ
}
PROMPT_COMMAND='share_history' #sxΐs
shopt -s histappend

# --- alias ---
alias d='dstat -ta'
alias t='hddtemp 2>/dev/null'
alias ls='ls -F --color -a'
alias less='less -RX'
alias more='less'
alias mroe='less'
alias cp='cp -i'
alias rm='rm -i'
alias ll='ls -alF -h --color | less -RXr'
alias gh='history|grep'
alias watch='watch --differences'
alias nkfo='nkf --overwrite'
alias ex='open .' #OSX
alias psf='ps -e uxf | less -S'
alias sc='screen'
alias top='htop'
alias df='df -h'
# cd 
alias cdb="cd ~/bin"
alias cdd="cd ~/dotfiles"
alias cde="cd ~/develop"
alias cdv="cd ~/.vim"
alias cdc="cd ~/conf"
alias cds="cd ~/share"
alias cdl="cd ~/log"
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

# --- UtilΦ ---
function sep { 
    SEP=" "
    [ "$1" = "" ] && SEP="---"
    echo -e "---$SEP$1$SEP---"
}

# --- LinuxΗ ---
[ `whoami` = 'root' ] && DO="" || DO="sudo"
function s {
    [ "$1" = "" ] || [ "$2" = "" ] && return
    $DO systemctl $1 $2
    $DO systemctl status $2
}
function svs {
    cmd="systemctl list-unit-files --type=service"
    case $1 in
        "l") $cmd ;;
        "a") $cmd | sed -r 's/^(.+?)\.service.+$/\1/' | awk '{printf " %s |",$1}'; echo ;;
        *)   $cmd | grep enable | sed -r 's/^(.+?)\.service.+$/\1/' | awk '{printf " %s |",$1}'; echo ;;
    esac
}
function sts {
    $DO systemctl status $1
}
function res {
    [ "$1" = "" ] && return
    $DO systemctl stop $1
    sleep 1
    $DO systemctl start $1
    $DO systemctl status $1
}

# --- VerΗ ---
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

# --- pkgΗ ---
# apt
alias a="sudo apt"
function au {  
    sep "update & upgrade" && sudo apt-get update && sudo apt-get upgrade 
    sep "dist-upgrade" && sudo apt-get dist-upgrade
    sep "autoremove & clean" && sudo apt-get autoremove && sudo apt-get clean
    echo ""
}

# --- docker ---
alias cdp='cd ~/pose'
alias dls="docker container ls -a && echo '' && docker image ls"
alias dsh="docker container exec -it"

alias dp="docker compose"
alias dpup="docker compose up -d && sleep 2 && docker compose logs -f --tail=40"
alias dpdown='docker compose down'
function dpres() {
  docker compose restart $1 && sleep 3 && docker compose logs --tail=10
}
alias dpinit='docker compose down && sleep 2 && docker compose up -d && sleep 2 && docker compose logs -f --tail=40'
alias dplog='docker compose logs --tail=30'
alias dplogf='docker compose logs -f --tail=30'


