#!/bin/bash

brew install ssh-copy-id
brew cask install macdown
brew cask install sublime-text
brew cask install keepassx
brew cask install google-chrome
brew cask install docker
brew cask install vagrant virtualbox virtualbox-extension-pack
brew cask install atom
# http://blog.csdn.net/qianghaohao/article/details/52331432
echo 'registry=https://registry.npm.taobao.org/' >> ~/.atom/.apmrc
echo 'strict-ssl=false' >> ~/.atom/.apmrc

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
brew cask install vagrant-manager
brew cask install insomnia

brew install graphviz
brew cask install gimp
brew cask install licecap
brew cask install gitter


brew install heroku
heroku help

# pow
curl -v get.pow.cx | sh
