#!/usr/bin/env bash

ln -s $PWD/vim        $HOME/.vim
ln -s $PWD/vimrc      $HOME/.vimrc
ln -s $PWD/tmux.conf  $HOME/.tmux.conf
# ln -s $PWD/irbc       $HOME/.irbc
ln -s $PWD/gitconfig  $HOME/.gitconfig
ln -s $PWD/vim        $HOME/.config/nvim # neovim
# ln -s $PWD/vimrc      $HOME/.config/nvim/init.vim # neovim

echo "Done linking up necessary files."
