# environment variables ------------------------ {{{
export SHELL=/bin/bash
# }}}
# 'zsh' and 'bash' common settings ------------- {{{
# aliases, env's, path's
if [ -r ~/.shell.commons ] ; then
  source ~/.shell.commons
fi
# }}}
# source ~/.bash_aliases ----------------------- {{{
if [ -r ~/.bash_aliases ] ; then
  source ~/.bash_aliases
fi
# }}}
# source ~/.bash_pathes ------------------------ {{{
if [ -r ~/.bash_pathes ] ; then
  source ~/.bash_pathes
fi
# }}}
