autoload -U +X bashcompinit && bashcompinit

if [ -x "/usr/local/bin/vault" ]; then
  complete -o nospace -C /usr/local/bin/vault vault
fi
