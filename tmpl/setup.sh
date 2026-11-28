#!/bin/bash
# 設定ファイル取り込み（既存ファイルは *.org に退避）
D=~/dotfiles
function cpt { [ -e "$2" ] && mv "$2" "$2.org"; cp -p "$1" "$2"; echo "copy $1 -> $2"; }
function lnk { [ -e "$2" ] && mv "$2" "$2.org"; ln -s "$1" "$2"; echo "link $1 -> $2"; }

# bash
cpt $D/tmpl/bashrc ~/.bashrc
cpt $D/tmpl/bash_profile ~/.bash_profile
cpt $D/bash/.dir_colors ~/.dir_colors
lnk $D/bash/.screenrc ~/.screenrc

# vim
cpt $D/tmpl/vimrc ~/.vimrc
mkdir -p ~/.vim/vimtmp ~/.vim/bundle
[ -d $D/vim/vundle.git ] || (cd $D && git submodule add https://github.com/VundleVim/Vundle.vim.git vim/vundle.git)
echo "vim起動後 :BundleInstall を実行"
