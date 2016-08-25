#!/bin/bash

# Rbenv: https://github.com/rbenv/ruby-build/wiki
brew install openssl libyaml libffi readline
brew install rbenv && eval "$(rbenv init -)"

# initialize
RUBY_VERSION=2.3.1
GEM_SOURCES=https://gems.ruby-china.org/
CHECK_RUBY_INSTALLED=$(rbenv versions | grep $RUBY_VERSION | wc -l)
CHECK_GEM_SOURCES=$(gem sources | grep $GEM_SOURCES | wc -l)
export RUBY_BUILD_MIRROR_URL="https://ruby.taobao.org/mirrors/ruby/ruby-${RUBY_VERSION}.tar.bz2#"
export RUBY_CONFIGURE_OPTS="--disable-install-doc  --with-readline-dir=$(brew --prefix readline)"

# Ruby
if [ ! $CHECK_RUBY_INSTALLED -ge 1 ]; then
  rbenv install ${RUBY_VERSION}
fi
rbenv global ${RUBY_VERSION}
rbenv shell ${RUBY_VERSION}

# Gem
if [ ! $CHECK_GEM_SOURCES -ge 1 ]; then
  gem sources --add $GEM_SOURCES --remove https://rubygems.org/
  echo 'gem: --no-document' | tee -a ~/.gemrc
fi

# bundler
gem install bundler
bundle config mirror.https://rubygems.org https://gems.ruby-china.org

# framework
gem install rails
gem install sinatra

# tools
gem install pry
gem install pry-rails
gem install awesome_print
gem install rest-client
gem install foreman
gem install powder


# profile for fish
echo '# rbenv' | tee -a ~/.config/fish/config.fish ~/.zshrc ~/.bashrc
echo 'status --is-interactive; and . (rbenv init -|psub)' | tee -a ~/.config/fish/config.fish
echo 'eval "$(rbenv init -)"' | tee -a ~/.zshrc ~/.bashrc
