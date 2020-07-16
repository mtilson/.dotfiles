" this file is based on the following ones:
" * https://github.com/fatih/vim-go/wiki/Tutorial
" * https://github.com/mitchellh/vim-misc

set encoding=utf-8              " Set default encoding to UTF-8
scriptencoding utf-8            " Set encoding used in scripts to UTF-8

call plug#begin()
Plug 'hashivim/vim-terraform'
Plug 'vim/killersheep'
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'AndrewRadev/splitjoin.vim'
				" 'gS' split a one-liner into multiple lines
				" 'gJ' (cursor on 1st line of a block) join
				" block into a single-line statement
"lug 'SirVer/ultisnips'
				" solution for snippets
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()


"----------------------------------------------------------------------
" Basic Options
"----------------------------------------------------------------------
let mapleader=";"         " The <leader> key
"et mapleader=","         " By default it's the backslash
set autoread              " Reload files that have not been modified
set backspace=2           " Makes backspace behave like you'd expect
set colorcolumn=78        " Highlight 80 character limit
set hidden                " Buffers are backgrounded without being saved
set laststatus=2          " Always show the status bar
set list                  " Show invisible characters
set listchars=tab:›\ ,eol:¬,trail:⋅ 
                          "Set the characters for the invisibles
set number                " Show line numbers
set ruler                 " Show the line number and column in the status bar
set t_Co=256              " Use 256 colors
set scrolloff=999         " Keep the cursor centered in the screen
set showmatch             " Highlight matching braces
"et noshowmatch           " Do not show matching brackets by flickering
set showmode              " Show the current mode on the open buffer
"et noshowmode            " We show the mode with airline or lightline
set splitbelow            " Splits show up below by default
set splitright            " Splits go to the right by default
set title                 " Set the title for gvim
set visualbell            " Use a visual bell to notify us

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set autoindent                  " Enabile Autoindent
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set autowrite                   " Automatically save before :next, :make etc.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
"et nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
"et updatetime=800        " Timeout for autoupdates of status line

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" Colorscheme: molokai
syntax enable " 'syntax on' overrules your settings with defaults
let s:plug_cs_molokai = '~/.vim/plugged/molokai/'
if ! empty(glob(s:plug_cs_molokai))
  let g:rehash256 = 1
  let g:molokai_original = 1
  colorscheme molokai
  hi CursorLine ctermbg=237
  hi ColorColumn ctermbg=235
endif
" Colorscheme: papercolor-theme
"set background=dark "dark or light

"let s:plug_cs_paper = '~/.vim/plugged/papercolor-theme/'
"if ! empty(glob(s:plug_cs_paper))
  "colorscheme PaperColor
"endif

"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------
" Remap a key sequence in insert mode to kick me out to normal
" mode. This makes it so this key sequence can never be typed
" again in insert mode, so it has to be unique.
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>
inoremap kk <esc>
inoremap kK <esc>
inoremap Kk <esc>
inoremap KK <esc>
inoremap kj <esc>
inoremap kJ <esc>
inoremap Kj <esc>
inoremap KJ <esc>

" Make j/k visual down and up instead of whole lines. This makes word
" wrapping a lot more pleasent.
noremap j gj
noremap k gk

" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Get rid of search highlights
noremap <silent><leader>/ :nohlsearch<CR>

" Buffer management
"nnoremap <leader>d :bd<CR>

" Edit/ReSource ~/.vimrc ------------------------- {{{
nnoremap <leader>ed :vsplit $MYVIMRC<cr>
nnoremap <leader>re :source $MYVIMRC<cr>
" }}}

" :q is the same as :Q ... as :q requires Shift, and
" sometime q become Q
command Q q

" Break line
nnoremap <leader>b viw<ESC>a <ESC>bi<BS><CR><ESC>viw<ESC>lx^
nnoremap <leader>B viw<ESC>a <ESC>bi<BS><CR><ESC>viw<ESC>lx^<S-j>

" Show cursorline only in active window
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""
" Zoom-in and zoom-out the splits
noremap Zz <c-w>_\|<c-w>\|
noremap Zo <c-w>=

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Cleaning up the screen
"nmap <silent> <C-L> <C-L>:nohlsearch<CR>:match<CR>:diffupdate<CR>

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-terraform
let g:terraform_fmt_on_save=1

" vim-go
let g:go_test_timeout = '10s' "default
let g:go_fmt_autosave = 1 "default
let g:go_textobj_include_function_doc = 1 "default
let g:go_fmt_fail_silently = 0 "default
let g:go_addtags_transform = "snake_case" "default , or 'camelCase'
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck'] "default
let g:go_metalinter_autosave = 1 "call linter whenever you save a file
let g:go_metalinter_autosave_enabled = ['vet', 'golint'] "osave checkers
let g:go_metalinter_deadline = "5s" "default
let g:go_def_mode = 'guru' "default, or 'godef'
let g:go_decls_includes = "func,type" "default
let g:go_auto_type_info = 1 "automatically show information under cursor
let g:go_auto_sameids = 0 "automatically highlight matching identifiers
"et g:go_build_tags = "mycustomtag" "permanent custom build tags
let g:go_play_open_browser = 1 "default
"et g:go_play_browser_command = "chrome" "in case of browser problem
let g:go_def_mapping_enabled = 0 "it is handled by LanguageClient [LC]

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1 "operators
let g:go_highlight_build_constraints = 1 "build tags

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup deftabs "tf, json, ...
  autocmd!
  autocmd BufNewFile,BufRead *.tf setlocal expandtab tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.md setlocal noexpandtab tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.json setlocal noexpandtab tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yaml setlocal expandtab tabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.yml setlocal expandtab tabstop=2 shiftwidth=2
augroup END

augroup json "json, ...
  autocmd!
  autocmd FileType json nmap <leader>js :call <SID>parse_via_jq()<CR>
augroup END
function! s:parse_via_jq()
  let l:tmp = system("type -a jq &>/dev/null")
  if !v:shell_error
    :w
    let l:file = expand('%')
    let l:tmp = system("jq . " . l:file . " &>/dev/null")
      if !v:shell_error
        :%!jq --tab .
        echom "parse via jq: OK"
      else
        echom "parse via jq: Not OK"
      endif
  else
    echom "jq is not available"
  endif
endfunction

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)

  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " default syntax highlighting for Go HTML template is enabled
  " for .tmpl files; enable it for another filetype with help of:
  autocmd BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" -------------------------------------------------------------------------------------------------
" powerline for vim
" -------------------------------------------------------------------------------------------------
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
