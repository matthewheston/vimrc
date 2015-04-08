set nocompatible

"Vundle {{{
filetype off

set rtp+=~/.vim/bundle/vundle/.
call vundle#rc()
Bundle 'gmarik/vundle'

"Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'hallison/vim-markdown'
Bundle 'jQuery'
Bundle 'Shougo/neosnippet'
Bundle 'tpope/vim-commentary'
Bundle 'benmills/vimux'
Bundle 'ctrlp.vim'
Bundle 'othree/html5.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ack.vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'mikewest/vimroom'

filetype plugin indent on
set ofu=syntaxcomplete#Complete
"}}}

"Set options {{{

"Look and feel
set number
syntax on
set background=dark
colorscheme solarized
set ruler
set autowrite

"formatting
"tabs are 2 characters, and aren't spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set backspace=indent,eol,start
set textwidth=0

"searching
set incsearch
set hlsearch
set gdefault

"history
set history=50
set undolevels=1000

"folding
set foldmethod=marker

set completeopt=longest,menuone,preview
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
			\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
set autowrite
set showcmd


let g:syntastic_mode_map = { 'mode': 'passive' }

"}}}

"Auto commands {{{

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

"Remove any trailing whitespace that is in the file
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"auto close preview window when using completion
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
"}}}

"Mappings {{{
"movement
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"leader
let mapleader = " "
let maplocalleader = "\\"

"vimrc quick edit
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

"consistent n/N
noremap <silent> n /<CR>
noremap <silent> N ?<CR>

"i don't want to reach!
inoremap jk <esc>

nnoremap <Leader>hl :nohl<cr>

"window navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"NERDTREE
nnoremap <Leader>nt :NERDTreeToggle<cr>

"Vimux
nnoremap <Leader>tp :PromptVimTmuxCommand<cr>
nnoremap <Leader>tg :InspectVimTmuxRunner<cr>
nnoremap <Leader>tx :CloseVimTmuxPanes<cr>
vnoremap <Leader>ts "vy :call RunVimTmuxCommand(@v)<CR>
"}}}

"Python {{{

au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set expandtab

let python_highlight_all=1

highlight BadWhitespace ctermbg=red guibg=red

"Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" for virtualenv-vim
let g:virtualenv_auto_activate = 1

"}}}

"Ruby {{{

au BufRead,BufNewFile *.rb set tabstop=2
au BufRead,BufNewFile *.rb set shiftwidth=2
au BufRead,BufNewFile *.rb set softtabstop=2
au BufRead,BufNewFile *.rb set expandtab

au FileType ruby let g:rubycomplete_buffer_loading=1
au FileType ruby let g:rubycomplete_classes_in_global=1

"}}}

"Writing {{{

au BufRead,BufNewFile *.md set tw=80
au BufRead,BufNewFile *.tex set tw=80
au BufRead,BufNewFile *.tex nnoremap <buffer> <localleader>c :!texcount -total %<CR>

"}}}

"Clojure{{{

"VimClojure options
let g:vimclojure#ParenRainbow=1
let g:vimclojure#DynamicHighlighting=1

"}}}
