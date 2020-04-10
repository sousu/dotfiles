
dotfiles
=========

自分用のdotfile集

## 導入

HTTPS時／clone及びVundleの取込

    git clone https://sousu@github.com/sousu/dotfiles.git
    git submodule add http://github.com/gmarik/vundle.git ~/dotfiles/vim/vundle.git

SSH時／sshキーを準備する
 
    ssh-keygen -r rsa

pubキーを登録したら,ssh/configに追記する

    Host github.com
        User git
        Port 22
        Hostname github.com
        IdentityFile ~/.ssh/id_git
        TCPKeepAlive yes
        IdentitiesOnly yes

clone／Vundleの取込

    git clone git@github.com:sousu/dotfiles.git
    git submodule add http://github.com/gmarik/vundle.git ~/dotfiles/vim/vundle.git


## 個別設定

### Bash

テンプレート取込で設定の場合

    cp -p ~/dotfiles/tmpl/bashrc ~/.bashrc ; source ~/.bashrc
    cp -p ~/dotfiles/tmpl/bash_profile ~/.bash_profile

シンボリックでの設定の場合

    rm ~/.bashrc ; ln -s ~/dotfiles/bash/.bashrc ~/.bashrc ; source ~/.bashrc
    rm ~/.bash_profile ; ln -s ~/dotfiles/bash/.bash_profile ~/.bash_profile

Screen他の準備

    ln -s ~/dotfiles/bash/.screenrc ~/.screenrc
    ln -s ~/dotfiles/bash/.dir_colors ~/.dir_colors

### Vim

vimrc及び関連フォルダの準備

    ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
    mkdir -p ~/.vim/vimtmp ~/.vim/bundle

Vimを起動してVundleからplugin等インストール

    :BundleInstall

### Git

ユーザ／メール設定

    git config --global user.name XXX
    git config --global user.email XXX@XXX.jp


