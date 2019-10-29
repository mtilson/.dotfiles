## Collection of `dotfiles` for `$HOME`

### Clone Repo

* `test -d $HOME/.dotfiles && mv -f $HOME/.dotfiles $HOME/.dotfiles.bak`
* `git clone https://github.com/mtilson/.dotfiles.git $HOME/.dotfiles`

### Link configuration files to ones from the Repo 

#### Vim

* `test -f $HOME/.vimrc && cp -f $HOME/.vimrc $HOME/.vimrc.bak`
* `ln -sf $HOME/.dotfiles/.vimrc $HOME/`

* `test -d $HOME/.vim && cp -rf $HOME/.vim $HOME/.vim.bak`
* `ln -sf $HOME/.dotfiles/.vim $HOME/`
