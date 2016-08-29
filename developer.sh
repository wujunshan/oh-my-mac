#!/bin/bash

brew cask install mou
brew cask install sublime-text
brew cask install keepassx
brew cask install google-chrome
brew cask install docker
brew cask install vagrant virtualbox virtualbox-extension-pack
brew cask install atom
brew cask install wechat-web-devtools
brew install hub
brew install tig
brew install htop
brew install tree
# https://dev.yorhel.nl/ncdu
brew install ncdu
brew install wget
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
                    qlprettypatch quicklook-csv betterzipql qlimagesize \
                    webpquicklook suspicious-package
brew cask install charles
brew cask install sequel-pro
brew cask install dbeaver-enterprise
brew cask install wireshark

brew install heroku
heroku --version

# pow
curl -v get.pow.cx | sh
