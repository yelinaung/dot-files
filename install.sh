#!/usr/bin/env bash

ln -s $PWD/vim        $HOME/.vim
ln -s $PWD/vimrc      $HOME/.vimrc
ln -s $PWD/tmux.conf  $HOME/.tmux.conf
ln -s $PWD/gitconfig  $HOME/.gitconfig
ln -s $PWD/vim        $HOME/.config/nvim # neovim

if [ ! -d "$HOME/.config/nvim" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir -p $HOME/.config/nvim
fi
ln -s $PWD/nvim_init $HOME/.config/nvim/init.vim # neovim

echo "Done linking up necessary files."
