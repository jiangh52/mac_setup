#!/bin/sh

echo "==>" Copy dot/setting files
cp ./.bashrc ./.profile ./.vimrc ~/
cp -r ./.vim ./.jupyter ~/

echo "==>" Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "==>" Install git via homebrew
brew install git

echo "==>" Install bash-complete via homebrew
brew install bash-completion

echo "==>" Load .bashrc
source ~/.bashrc

echo "==>" Install dein.vim to ~/.cache/dein/
if [ ! -e "~/.cache/dein/" ]; then
    mkdir -p ~/.cache/dein 
fi
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein/
rm -f ./installer.sh

echo "==>" Start installing python environment

echo "  1. Install pyenv"
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

echo "  2. Install miniconda"
NEWEST_CONDA=`pyenv install -l | grep miniconda3 | tail -n1 | sed -e "s/ //g"`
pyenv install $NEWEST_CONDA
pyenv rehash
pyenv global $NEWEST_CONDA
echo 'export PATH="$PYENV_ROOT/versions/'$NEWEST_CONDA'/bin/:$PATH"' >> ~/.bashrc
echo 'export CPLUS_INCLUDE_PATH="~/.pyenv/versions/'$NEWEST_CONDA'/include"' >> ~/.bashrc
source ~/.bashrc

echo "  3. Update conda packages"
conda update conda
conda install -y numpy pandas matplotlib seaborn scikit-learn jupyter

echo "  FINISH python environment construction"
echo "==>" Install mecab via homebrew
brew install mecab mecab-ipadic

echo "==>" Install cabocha via homebrew 
brew install cabocha

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

echo "  FINISH ruby environment construction"

echo "====================
A list of things to install:
######(Tools)#########
Sublime: https://www.sublimetext.com/
Slack: https://slack.com/downloads/osx
Evernote: https://evernote.com/intl/jp/download/
KeePassX: https://www.keepassx.org/
MySQL Workbench: https://dev.mysql.com/downloads/workbench/
Dash: https://kapeli.com/dash

######(Entertainment)#######
Spotify: https://www.spotify.com/jp/download/other/

######(Other settings)#######
Sublime Package Control: https://packagecontrol.io/installation
Sublime Package:
    - ConvertToUTF8
    - Codecs33
    - DashDoc
Sublime BuildEnvironment
    - Python3
Sublime Setting
    - cp Preferences.sublime-settings '/Users/jiang/Library/Application Support/Sublime Text 3/Packages/User/'
"
