#!/bin/bash

# initialize
PYTHON_VERSION=3.5.2
PYPI_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
export PYTHON_BUILD_MIRROR_URL='http://oej2vuvzj.bkt.clouddn.com'

# Pyenv
brew install openssl readline xz
brew install pyenv  && eval "$(pyenv init -)"
brew install pyenv-virtualenv && eval "$(pyenv virtualenv-init -)"
brew install pyenv-which-ext

# Python
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION
pyenv shell $PYTHON_VERSION
pyenv rehash

# pip
tee /tmp/pip.conf << EOD
[global]
index-url = $PYPI_INDEX_URL
[install]
use-mirrors = true
mirrors = ${PYPI_INDEX_URL%/simple}
EOD

mkdir ~/.pip
cp /tmp/pip.conf ~/.pip/pip.conf

# !not support socks5
pip install --upgrade pip

# Framework
pip install django

# profile for fish
echo '# pyenv' | tee -a ~/.config/fish/config.fish ~/.zshrc ~/.bashrc
echo 'status --is-interactive; and . (pyenv init -|psub)' | tee -a ~/.config/fish/config.fish
echo 'status --is-interactive; and . (pyenv virtualenv-init -|psub)' | tee -a ~/.config/fish/config.fish
echo 'eval "$(pyenv init -)"' | tee -a ~/.zshrc ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' | tee -a ~/.zshrc ~/.bashrc
