#!/bin/bash

brew cask install java
brew cask install virtualbox virtualbox-extension-pack
brew install android-sdk
brew install android-studio
brew cask install genymotion


# profile for fish
echo "# Android SDK" | tee -a ~/.config/fish/config.fish ~/.zshrc ~/.bashrc
echo "set -gx ANDROID_HOME $(brew --prefix android-sdk)" | tee -a ~/.config/fish/config.fish
echo "export ANDROID_HOME=\"$(brew --prefix android-sdk)\"" |  tee -a ~/.zshrc ~/.bashrc
