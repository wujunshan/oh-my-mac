#!/bin/bash

# initialize
RUBY_VERSION=2.3.1
GEM_SOURCES_CHINA=https://gems.ruby-china.org/
GEM_SOURCES_ORIGIN=https://rubygems.org/
export RUBY_BUILD_MIRROR_URL=http://oeijhg095.bkt.clouddn.com
export RUBY_CONFIGURE_OPTS="--disable-install-doc  --with-readline-dir=/usr/local/opt/readline"

# Rbenv: https://github.com/rbenv/ruby-build/wiki
brew install openssl libyaml libffi readline
brew install rbenv && eval "$(rbenv init -)"

# Ruby
rbenv install -kvs $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv shell $RUBY_VERSION
rbenv rehash


# Gem
gem sources --add $GEM_SOURCES_CHINA --remove $GEM_SOURCES_ORIGIN -v
echo 'gem: --no-document' | tee -a ~/.gemrc

# bundler
gem install bundler
bundle config mirror.${GEM_SOURCES_ORIGIN%/} ${GEM_SOURCES_CHINA%/}

# framework
gem install rails
gem install sinatra

# profile for fish
echo '# rbenv' | tee -a ~/.config/fish/config.fish ~/.zshrc ~/.bashrc
echo 'status --is-interactive; and . (rbenv init -|psub)' | tee -a ~/.config/fish/config.fish
echo 'eval "$(rbenv init -)"' | tee -a ~/.zshrc ~/.bashrc
