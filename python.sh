#!/bin/bash

brew install openssl readline xz
brew install pyenv && eval "$(pyenv init -)"

# initialize
PYTHON_VERSION=2.7.12
export PYTHON_BUILD_MIRROR_URL=

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION 
pyenv shell $PYTHON_VERSION


# pip mirror
mkdir ~/.pip
echo '[global]' | tee -a ~/.pip/pip.conf
echo 'index-url = https://pypi.tuna.tsinghua.edu.cn/simple' | tee -a ~/.pip/pip.conf

# profile for fish

echo '# pyenv' | tee -a ~/.config/fish/config.fish ~/.zshrc ~/.bashrc
echo 'status --is-interactive; and . (pyenv init -|psub)' | tee -a ~/.config/fish/config.fish
echo 'eval "$(pyenv init -)"' | tee -a ~/.zshrc ~/.bashrc
