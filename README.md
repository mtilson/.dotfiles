## Collection of `dotfiles` for `$HOME`

### Clone Repo

* `test -d $HOME/.dotfiles && mv -f $HOME/.dotfiles $HOME/.dotfiles.bak`
* `git clone https://github.com/mtilson/.dotfiles.git $HOME/.dotfiles`

### Link configuration files to ones from the Repo 

#### Powerline for Vim, Bash, Tmux, etc

##### .config/powerline
* `test -d $HOME/.config || mkdir -p $HOME/.config`
* `test -d $HOME/.config/powerline && cp -rf $HOME/.config/powerline $HOME/.config.powerline.bak`
* `ln -sf $HOME/.dotfiles/.config/powerline $HOME/.config/`

##### .vimrc
* `test -f $HOME/.vimrc && cp -f $HOME/.vimrc $HOME/.vimrc.bak`
* `ln -sf $HOME/.dotfiles/.vimrc $HOME/`

##### .vim/
* `test -d $HOME/.vim && cp -rf $HOME/.vim $HOME/.vim.bak`
* `ln -sf $HOME/.dotfiles/.vim $HOME/`

#### Bash

##### .bashrc
* `test -f $HOME/.bashrc && cp -f $HOME/.bashrc $HOME/.bashrc.bak`
* `ln -sf $HOME/.dotfiles/.bashrc $HOME/`

##### .bash_profile
* `test -f $HOME/.bash_profile && cp -f $HOME/.bash_profile $HOME/.bash_profile.bak`
* `ln -sf $HOME/.dotfiles/.bash_profile $HOME/`

##### .bash_aliases
* `test -f $HOME/.bash_aliases && cp -f $HOME/.bash_aliases $HOME/.bash_aliases.bak`
* `ln -sf $HOME/.dotfiles/.bash_aliases $HOME/`

##### .bash_completion
* `test -f $HOME/.bash_completion && cp -f $HOME/.bash_completion $HOME/.bash_completion.bak`
* `ln -sf $HOME/.dotfiles/.bash_completion $HOME/`
