test "$ZSH_THEME" = "powerlevel10k/powerlevel10k" || return 0
test -e $ZSH_CUSTOM/themes/powerlevel10k && return 0

is_app_installed () {
	type "$1" &>/dev/null
}

test ${is_app_installed} git || {
	export ZSH_THEME="random"
	return 1
}

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

test -e $ZSH_CUSTOM/themes/powerlevel10k || {
	export ZSH_THEME="random"
	return 1
}

return 0
