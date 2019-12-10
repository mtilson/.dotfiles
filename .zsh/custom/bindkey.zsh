#bindkey '^[l' down-case-word

function _magic-alt-l () {
    if [[ -z "$BUFFER" ]]; then
        BUFFER="ls"
        zle accept-line
    else
        zle down-case-word
    fi
}

zle -N _magic-alt-l

bindkey '\el' _magic-alt-l
