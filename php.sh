#!/bin/bash

# requirement
COMPOSER_PATH=~/.composer/vendor/bin

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/php

# PHP
brew install php56

# Composer
brew install composer
composer config -g repo.packagist composer https://packagist.phpcomposer.com

# Laravel
composer global require "laravel/installer"

# Lumen
composer global require "laravel/lumen-installer"

# profile for fish
echo "# PHP CLI & FPM" | tee -a ~/.config/fish/config.fish ~/.zshrc ~/.bashrc
echo "set PATH /usr/local/sbin \$PATH $(brew --prefix homebrew/php/php56)/bin $COMPOSER_PATH " | tee -a ~/.config/fish/config.fish
echo "export PATH=\"/usr/local/sbin:\$PATH:$(brew --prefix homebrew/php/php56)/bin:$COMPOSER_PATH\"" | tee -a ~/.zshrc ~/.bashrc
