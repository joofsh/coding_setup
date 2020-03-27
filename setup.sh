#!/bin/bash

# Install homebrew

if which brew; then
  echo "Brew already installed"
else
  echo "Installing brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install rbenv tmux dnsmasq redis the_silver_searcher reattach-to-user-namespace hub


# Healthify specific
brew tap cartr/qt4
brew tap-pin cartr/qt4
brew install qt-webkit@2.3

echo "Installing ruby"
cd ~/src/healthify
rbenv install $(cat .ruby-version)
gem update --system
gem install bundler
bundle install

brew tap caskroom/cask
brew tap caskroom/versions
brew cask install java8
brew tap healthify/stale-brews
brew install elasticsearch@5.0


ln -s ~/src/coding_setup/.vimrc $HOME
ln -s ~/src/coding_setup/.tmux.conf $HOME
ln -s ~/src/coding_setup/.zshrc $HOME
ln -s ~/src/coding_setup/.sh $HOME
ln -s ~/src/coding_setup/.ignore $HOME


mkdir -p ~/.vim/backup_files
mkdir ~/.vim/swap_files
mkdir ~/.vim/undo_files
