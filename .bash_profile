# if [[ "$TERM" != "screen-256color" ]] ; then
#   tmux attach-session -t "$USER" || tmux new-session -s "$USER"
# fi

# source ~/.bashrc ----------------------------- {{{
if [ -r ~/.bashrc ]; then . ~/.bashrc ; fi
# }}}
# completion: 'bash' --------------------------- {{{

# requirements:
# install 'brew' manually:
# > /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# see https://brew.sh

# install 'bash_completion' via 'brew':
# > brew install bash-completion

# it also sources '~/.bash_completion'
if is_app_installed brew ; then
  if [ -f $(brew --prefix)/etc/bash_completion ] ; then
      . $(brew --prefix)/etc/bash_completion
  fi
fi
# }}}
# 'powerline' bash binding --------------------- {{{

# requirements:
# install 'powerline-status' python3 lib:
# > pip3 install powerline-status

PL_BASH_BINDING_SUF="powerline/bindings/bash/powerline.sh"
if is_app_installed pip3 ; then
  site_packages=$(pip3 show powerline-status | grep '^Location:' | cut -d' ' -f2 2>/dev/null)
  if test -n "$site_packages" && test -e "${site_packages}/${PL_BASH_BINDING_SUF}" ; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source ${site_packages}/${PL_BASH_BINDING_SUF}
  else
    printf "WARNING: powerline settings: python lib 'powerline-status' is not installed"
  fi
else
  printf "WARNING: powerline settings: command 'pip3' is not found"
fi
# }}}
# 'cover ()' golang test coverage and report --- {{{
cover () {
    local t=$(mktemp -t cover)
    go test $COVERFLAGS -coverprofile=$t $@ \
        && go tool cover -func=$t \
        && unlink $t
}
# }}}
# 'z' for jump around -------------------------- {{{

# requirements:
# install 'z' via 'brew'
if [ -f /usr/local/etc/profile.d/z.sh ]; then
    . /usr/local/etc/profile.d/z.sh
fi
# }}}
# flow control: <C-s>/<C-q> -------------------- {{{

# <C-s> pausing output from terminal
# <C-q> restoring it
stty stop ''
stty start ''
stty -ixon
stty -ixoff
# }}}

# see also: https://gist.githubusercontent.com/natelandau/10654137/raw/32eb964560873a8c23d7745de2736bef437524ba/.bash_profile
