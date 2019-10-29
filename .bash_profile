if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases ; fi
if [ -r ~/.bash_completion ]; then . ~/.bash_completion ; fi

# 'brew' completion ---------------------------- {{{

# requirements: 
# install 'brew':
# see https://brew.sh
# > /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if is_app_installed brew ; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then . $(brew --prefix)/etc/bash_completion ; fi
fi
# }}}

# Google Cloud SDK completion ------------------ {{{

# requirements: 
# download and install Google Cloud SDK from versioned archives:
# see https://cloud.google.com/sdk/docs/downloads-versioned-archives
# > version="268.0.0" # change to the actual version
# > sdkfilename="google-cloud-sdk-${version}-$(uname -s | tr [A-Z] [a-z])-$(uname -m).tar.gz"
# > sdkdownloadprefix="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/"
# > cd ~/Downloads
# > curl -LO ${sdkdownloadprefix}${sdkfilename}
# > tar -xzvf ${sdkfilename} -C ~/Library

# Enable 'gcloud' completion
if [ -f ~/Library/google-cloud-sdk/completion.bash.inc ]; then . ~/Library/google-cloud-sdk/completion.bash.inc ; fi
# }}}

# 'z' for jump around ----------------------- {{{

# requirements: 
# install 'z':
# see https://github.com/rupa/z
# > cd ~/Downloads
# > git clone git@github.com:rupa/z.git
# > cd z
# > sudo cp z/z.sh /usr/local/bin/
# > sudo cp z/z.1 /usr/local/share/man/man1/

if [ -f /usr/local/bin/z.sh ]; then . /usr/local/bin/z.sh ; fi
# }}}

# Powerline 'bash' binding --------------------- {{{

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

# see also: https://gist.githubusercontent.com/natelandau/10654137/raw/32eb964560873a8c23d7745de2736bef437524ba/.bash_profile
