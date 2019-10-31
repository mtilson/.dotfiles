set nu

let mapleader = "-"
let maplocalleader = "-"

let s:plug_path = '~/.vim/autoload/plug.vim'
let s:plug_dir = '~/.vim/plugged'

if empty(glob(s:plug_path))
  silent execute '!curl -fLo '.s:plug_path.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(s:plug_dir)
  Plug 'junegunn/vim-plug'
  Plug 'tpope/vim-fugitive'
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
call plug#end()

set hlsearch
set incsearch
set shiftwidth=4

" Folding (Vimscript) -------------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

" Folding (Shell script) ----------------------- {{{
augroup filetype_sh
  autocmd!
  autocmd FileType sh setlocal foldmethod=marker
  autocmd FileType sh setlocal foldlevelstart=0
augroup END
" }}}

" Trailing whitespaces ------------------------- {{{
nnoremap <leader>w :execute "normal! :match Error /\\v\\s+$/\r"<cr>
nnoremap <leader>W :execute "normal! :match Normal /\\v\\s+$/\r"<cr>
" }}}

" Comment single line -------------------------- {{{
augroup comment_line
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType go         nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
augroup END
" }}}

" Edit/Source ~/.vimrc ------------------------- {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Statusline ----------------------------------- {{{
set laststatus=2
set statusline=%F         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=FileType: " Label
set statusline+=%y        " Filetype of the file
set statusline+=\ -\      " Separator
set statusline+=%4l       " Current line
set statusline+=/         " Separator
set statusline+=%-4L      " Total lines
" }}}

" Abbreviations -------------------------------- {{{
iabbrev @@ m@tilson.biz
iabbrev @C Copyright 2019 M. Tilson. All rights reserved.
iabbrev @W https://tilson.biz
iabbrev @S --<cr>M. Tilson<cr>m@tilson.biz<cr>--<cr>
" }}}

" Mapping (misc) ------------------------------- {{{

" source file itself
nnoremap <leader>s :source %<cr>

" toggle the line numbers for the current window off and on
nnoremap <leader>N :setlocal number!<cr>

" stop highlighting items from the last search
nnoremap <leader>, :nohlsearch<cr>

" <leader>[oO] - is the same as [oO] but escaping from insert mode
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>

" empty current line in insert mode
inoremap <leader>d <esc>ddO

" insert the \v for you whenever you begin a search
nnoremap / /\v

" to go to the beginning|end of the current line
nnoremap H ^
nnoremap L $

" disable arrows
noremap  <up>     <nop>
noremap  <down>   <nop>
noremap  <left>   <nop>
noremap  <right>  <nop>
inoremap <silent> <esc>A <nop>
inoremap <silent> <esc>B <nop>
inoremap <silent> <esc>C <nop>
inoremap <silent> <esc>D <nop>

" return to normal mode with 'jk' (or 'kj') and disable the '<esc>' key
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>
" }}}

" Toggling (misc) ------------------------------ {{{
nnoremap <leader>q :call <SID>QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
	execute g:quickfix_return_to_window . "wincmd w"
    else
	let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

nnoremap <leader>x :call <SID>SyntaxToggle()<cr>
function! s:SyntaxToggle()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction
" }}}

" Examples: "Learning Vimscript the Hard Way" -- {{{
""nnoremap <c-u> viwUviw<esc>
" 'viw'   - select internal word in VISUAL mode
"         - cursor is at the end of selected word
" 'U'     - uppercase selected and cancel VISUAL mode
"         - cursor is at the beginning of processed word
" 'viw'   - select internal word in VISUAL mode
"         - cursor is at the end of selected word
" '<esc>' - escape from visual mode
"
""inoremap <c-u> <esc>viwUviw<esc>a
" '<esc>' - switch to normal mode
" 'viw'   - select internal word in VISUAL mode
"         - cursor is at the end of selected word
" 'U'     - uppercase selected and cancel VISUAL mode
" 'viw'   - put cursor at the end of word
" '<esc>' - switch to normal mode
" 'a'     - add after "the end of word"
"
""nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" surround the word in double quotes (")
"
""nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" surround the word in single quotes (')
"
""vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>lel
" surround the selected visual block in double quotes (")
" '`>' - move cursor at the end of selected block
" '`<' - move cursor at the beginning of selected block
"
""vnoremap <leader>D <esc>`>a<cr><esc>`<i<cr><esc>!!date<cr>kJJ
" replace the selected visual block with output from `date` command
"
""set grepprg=grep\ -In\ $*\ /dev/null
" change external 'grep' command, $* will be replaced with provided vim grep cmd arguments
"
""nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" grep for the WORD under cursor and open the results in quickfix-window

""nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>
" function! s:FoldColumnToggle()
"     if &foldcolumn
"         setlocal foldcolumn=0
"     else
"         setlocal foldcolumn=4
"     endif
" endfunction
" }}}

" Enable PowerLine for VIM --------------------- {{{
"" Use the following steps:
""Step 1 - it is set by default
" set encoding=utf-8
"
""Step 2 - one of the following command
" set rtp+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim
" source   /usr/local/lib/python3.6/site-packages/powerline/bindings/vim/plugin/powerline.vim
"
""Step 3 - it is set by default
" set laststatus=2
"
""Step 4 - it is set by default
" set t_Co=256
function! EnablePowerline()
    let l:PL_VIM_BINDING_SUF = "powerline/bindings/vim"
    let l:dumb_stub =  system("type pip3 &>/dev/null")
    if v:shell_error != 0
        echom "WARNING: powerline settings: command 'pip3' is not found"
	return -1
    endif

    let l:site_packages = system("pip3 show powerline-status | grep '^Location:' | cut -d' ' -f2 2>/dev/null")
    if v:shell_error != 0
        echom "WARNING: powerline settings: command 'pip3 show powerline-status ...' returned error"
	return -1
    endif

    let l:site_packages = split(l:site_packages, '\v\n')[0]
    if site_packages == ""
        echom "WARNING: powerline settings: python lib 'powerline-status' is not installed"
	return -1
    endif

    let l:pl_vim_binding_path = l:site_packages . "/" . l:PL_VIM_BINDING_SUF
    if empty(glob(l:pl_vim_binding_path))
        echom "WARNING: powerline settings: python lib 'powerline-status' doesn't contain vim bindings"
	return -1
    endif

    exec 'set rtp+=' . l:pl_vim_binding_path
endfunction

" call EnablePowerline() " it takes about 1.3 sec to load VIM
" due to the above we just use 'set' command directly, which takes about 0.5 sec to load VIM
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim
" and without including PowerLine plugin it takes about 0.2 sec to load VIM
" }}}

" Enable Powerline for GUI VIM (e.g. MacVim) --- {{{
" 'Go Mono for Powerline' font to be installed (e.g. with 'Font Book.app')
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Go\ Mono\ for\ Powerline:h14
   endif
endif
" }}}
