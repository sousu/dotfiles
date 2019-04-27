# !/bin/sh
# 設定ファイル取り込み

# bash ---
echo "Copy \".vim\" "
cp -rp ~/dotfiles/.dir_colors ~/

# vim ---
echo "Link \".vim\""
mv ~/.vim ~/.vim_org
ln -s ~/dotfiles/.vim ~/.vim

echo "Make \".vimtmp\""
mkdir ~/.vimtmp

# mercurial ---
echo "Copy \".hgrc\" "
cp -rp ~/dotfiles/.hgrc ~/


function copy(){

}
function link(){

}
function link(){

}

