#!/bin/bash


# Make backup before overriding
mv ~/.zshrc ~/.zshrc_bak
mv ~/.tmux.config ~/.tmux.config_bak

cp ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.tmux.conf ~/.tmux.conf
cp ~/dotfiles/.sh/local.sh ~/.sh/local.sh
cp ~/dotfiles/.config/nvim/init_cursor.lua ~/.config/nvim/init_cursor.lua

