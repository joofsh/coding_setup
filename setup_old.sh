#!/bin/bash

# Install homebrew

if which brew; then
  echo "Brew already installed"
else
  echo "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jonathan.pagano/.zprofile
 eval "$(/opt/homebrew/bin/brew shellenv)"

fi

brew install rbenv tmux dnsmasq redis the_silver_searcher reattach-to-user-namespace hub neovim

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"




ln -s ~/src/coding_setup/.vimrc $HOME
ln -s ~/src/coding_setup/.config $HOME
ln -s ~/src/coding_setup/.tmux.conf $HOME
ln -s ~/src/coding_setup/.zshrc $HOME
ln -s ~/src/coding_setup/.sh $HOME
ln -s ~/src/coding_setup/.ignore $HOME


mkdir -p ~/.vim/backup_files
mkdir ~/.vim/swap_files
mkdir ~/.vim/undo_files
