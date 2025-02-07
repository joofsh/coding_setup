#!/bin/bash


# Make backup before overriding
mv ~/.zshrc ~/.zshrc_bak


ln -s ~/dotfiles/.config/nvim $HOME
ln -s ~/dotfiles/.tmux.conf $HOME
ln -s ~/dotfiles/.zshrc $HOME
ln -s ~/dotfiles/.sh $HOME
ln -s ~/dotfiles/.ignore $HOME


mkdir -p ~/.vim/backup_files
mkdir ~/.vim/swap_files
mkdir ~/.vim/undo_files
