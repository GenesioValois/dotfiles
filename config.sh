gem install overcommit rubocop flay fasterer foodcritic rails_best_practices sqlint brakeman
# install plug - a minimalist Vim plugin manager.
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# forces creation of a link
ln -f config/nvim/init.vim ~/.config/nvim/init.vim
ln -f config/nvim/mappings.vim ~/.config/nvim/mappings.vim
