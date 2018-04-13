#!/bin/sh

echo "==>" Copy dot/setting files
cp ./.bashrc ./.profile ./.vimrc ./.gitconfig ~/
cp -r ./.vim ./.jupyter ~/

echo "==>" Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "==>" Install and setup git via homebrew
brew install git git-flow
git config --global core.editor

echo "==>" Install bash-complete via homebrew
brew install bash-completion

echo "==>" Install others via homebrew 
brew install tig tree sqlite unrar codeclimate

echo "==>" Load .bashrc
source ~/.bashrc

echo "==>" Start installing python environment
echo "  1. Install python"
brew install python

echo "  2. Install packages"
pip install awscli bz2file bokeh cython docutils gensim ggplot graphviz holoviews html5lib ipython jupyter matplotlib networkx numpy pandas pathlib2 pillow pip plotly psycopg2 py4j pycodestyle pymysql pyspark PyYAML scikit-learn scipy seaborn sqlalchemy sqlite stemming urllib3 wheel 

echo "  3. FINISH python environment construction"

echo "==>" Start installing ruby environment
echo "  1. Install rbenv ruby-build"
brew install rbenv ruby-build
NEWEST_RUBY=`rbenv install --list | grep -E "^  [0-9\.]+$" | tail -n1 | sed -e "s/ //g"`
rbenv install $NEWEST_RUBY
rbenv global $NEWEST_RUBY
echo `eval "$(rbenv init -)"` >> ~/.bashrc

echo "  2. Install rails"
gem install rails
rbenv rehash

echo "  3. FINISH ruby environment construction"

