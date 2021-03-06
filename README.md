## Collection of `dotfiles` for `$HOME`

### Clone Repo

* `test -d ~/.dotfiles && mv -f ~/.dotfiles ~/.dotfiles.bak`
* `git clone https://github.com/mtilson/.dotfiles.git ~/.dotfiles`

### Link configuration files to ones from the Repo 

#### Powerline for Vim, Bash, Tmux, etc

##### .config/powerline
* `test -d ~/.config || mkdir -p ~/.config`
* `test -d ~/.config/powerline && cp -rf ~/.config/powerline ~/.config.powerline.bak`
* `ln -sf ../.dotfiles/.config/powerline ~/.config/`

##### .vimrc
* `test -f ~/.vimrc && cp -f ~/.vimrc ~/.vimrc.bak`
* `ln -sf .dotfiles/.vimrc ~/`

##### .vim/
* `test -d ~/.vim && cp -rf ~/.vim ~/.vim.bak`
* `ln -sf .dotfiles/.vim ~/`

#### Zsh

##### .zshrc
* `test -f ~/.zshrc && cp -f ~/.zshrc ~/.zshrc.bak`
* `ln -sf .dotfiles/.zshrc ~/`

#### Bash

##### .bashrc
* `test -f ~/.bashrc && cp -f ~/.bashrc ~/.bashrc.bak`
* `ln -sf .dotfiles/.bashrc ~/`

##### .bash_aliases
* `test -f ~/.bash_aliases && cp -f ~/.bash_aliases ~/.bash_aliases.bak`
* `ln -sf .dotfiles/.bash_aliases ~/`

##### .bash_completion
* `test -f ~/.bash_completion && cp -f ~/.bash_completion ~/.bash_completion.bak`
* `ln -sf .dotfiles/.bash_completion ~/`

##### .bash_pathes
* `test -f ~/.bash_pathes && cp -f ~/.bash_pathes ~/.bash_pathes.bak`
* `ln -sf .dotfiles/.bash_pathes ~/`

##### .bash_profile
* `test -f ~/.bash_profile && cp -f ~/.bash_profile ~/.bash_profile.bak`
* `ln -sf .dotfiles/.bash_profile ~/`

#### Shell's common groung

##### .shell.commons
* `test -f ~/.shell.commons && cp -f ~/.shell.commons ~/.shell.commons.bak`
* `ln -sf .dotfiles/.shell.commons ~/`

#### Tmux

##### .tmux.conf
* `test -f ~/.tmux.conf && cp -f ~/.tmux.conf ~/.tmux.conf.bak`
* `ln -sf .dotfiles/.tmux.conf ~/`

##### .tmux.Darwin.conf
* `test -f ~/.tmux.Darwin.conf && cp -f ~/.tmux.Darwin.conf ~/.tmux.Darwin.conf.bak`
* `ln -sf .dotfiles/.tmux.Darwin.conf ~/`
