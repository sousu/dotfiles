
dotfiles
=========

自分用のdotfile集

## 導入

HTTPS時

    git https://sousu@github.com/sousu/dotfiles.git
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

clone,vundleも取り込む

    git clone git@github.com:sousu/dotfiles.git
    git submodule add http://github.com/gmarik/vundle.git ~/dotfiles/vim/vundle.git


## 個別設定

### Bash

シンボリックでの設定の場合

    rm ~/.bashrc ; ln -s ~/dotfiles/bash/.bashrc ~/.bashrc ; source ~/.bashrc
    rm ~/.bash_profile ; ln -s ~/dotfiles/bash/.bash_profile ~/.bash_profile

ローカルの設定を行う場合は，テンプレートで取り込む

    cp -p ~/dotfiles/tmpl/bashrc ~/.bashrc ; source ~/.bashrc
    cp -p ~/dotfiles/tmpl/bash_profile ~/.bash_profile

Screen他の準備

    ln -s ~/dotfiles/bash/.screenrc ~/.screenrc
    ln -s ~/dotfiles/bash/.dir_colors ~/.dir_colors

### Vim

vimrc及び関連フォルダの準備

    ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
    mkdir -p ~/.vim/vimtmp ~/.vim/bundle

Vimを起動してvundleからplugin等インストール

    :BundleInstall


## License 
----------------
Copyright &copy; 2012 sousu
Licensed under the [Apache License, Version 2.0][Apache]
 
[Apache]: http://www.apache.org/licenses/LICENSE-2.0


