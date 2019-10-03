#install zsh and oh-my-zsh first

# used gems
gem install overcommit rubocop flay fasterer foodcritic rails_best_practices solargraph teamocil \
sass
# install plug - a minimalist Vim plugin manager.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ "$(uname)" == "Darwin" ]; then
  brew install the_silver_searcher tmux
  brew cask install font-meslo-nerd-font
else
  # used on work
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  sudo apt install silversearcher-ag tmux mssql-tools libmagickwand-dev libcurl4-openssl-dev \
    libc6-dev build-essential freetds-dev
fi

mkdir ~/workspace

git clone https://github.com/powerline/fonts.git ~/workspace
sh ~/workspace/fonts/install.sh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# forces creation of a link
ln -f config/nvim/init.vim ~/.config/nvim/init.vim
ln -f config/nvim/mappings.vim ~/.config/nvim/mappings.vim
ln -f config/tmux.conf ~/.tmux.conf
