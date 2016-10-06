#!/bin/bash


# initialize
export NVM_DIR=~/.nvm
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
mkdir $NVM_DIR

# nvm
brew install nvm watchman
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"

# node
nvm install node
nvm use node

# npm
npm config set registry https://registry.npm.taobao.org
# npm install -g react-native-cli
# npm install -g ember-cli
# npm install -g express-generator
# npm install -g bower

# profile for fish
echo '# rbenv' | tee -a ~/.config/fish/config.fish ~/.zshrc ~/.bashrc
tee -a ~/.zshrc ~/.bashrc << EOD
export NVM_DIR=~/.nvm
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
EOD
