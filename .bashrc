is_app_installed() {
  type "$1" &>/dev/null
}

export SHELL=/bin/bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH="$(go env GOPATH)"
export GOBIN="${GOPATH}/bin"

# PATH for GOPATH/bin -------------------------- {{{

# requirements: 
# install golang with 'brew':
# > brew install go

if is_app_installed go ; then
    if [ -d "$(go env GOPATH)/bin" ]; then
      export PATH=$PATH:$(go env GOPATH)/bin
    fi
fi
# }}}

# PATH for user's python3 bin ------------------ {{{

# Update PATH for user's python3 bin
if [ -d ~/Library/Python/3.7/bin ]; then
  export PATH=$PATH:~/Library/Python/3.7/bin
fi
# }}}

# PATH for Google Cloud SDK -------------------- {{{

# requirements: see ~/.bash_profile

# Update PATH for the Google Cloud SDK
if [ -f ~/Library/google-cloud-sdk/path.bash.inc ]; then
  . ~/Library/google-cloud-sdk/path.bash.inc
fi
# }}}
