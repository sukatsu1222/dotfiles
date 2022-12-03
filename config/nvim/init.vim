"=============================================================================
"" vim-plug
"=============================================================================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

filetype plugin indent on

"=============================================================================
"" vim-airline
"=============================================================================
set t_Co=256
set laststatus=2
set noshowmode
let g:airline_theme = 'dracula'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

syntax on

"=============================================================================
"" Basic Configurations
"=============================================================================
"" Encoding
if has('vim_starting')
  set encoding=utf-8
endif
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

"" Tabs.
set autoindent
set smartindent
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrapscan

"" Not use backup and swap
set nobackup
set noswapfile

"=============================================================================
"" Visual Configurations
"=============================================================================
colorscheme dracula
let g:dracula_colorterm = 0
syntax on
"set ruler
set number
set wrap

"set list
"set listchars=tab:>-,trail:-,nbsp:%,eol:<

set scrolloff=3

set modeline
set showcmd

"" highlight CursorLine
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLineNr cterm=reverse ctermfg=NONE ctermbg=NONE

"=============================================================================
"" Mappings
"=============================================================================

"" Move Cursor
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k
nnoremap <S-h> ^
nnoremap <S-l> $
nnoremap <S-j> }
nnoremap <S-k> {

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Clean search (highlight)
nnoremap <silent> <esc><esc> :<C-u>nohlsearch<cr>

"" Escape insert mode
inoremap jj <esc>
inoremap kk <esc>

set pastetoggle=<f5>

"" Write with sudo
cnoremap w!! w !sudo tee > /dev/null %<cr>>

"=============================================================================
"" Other Configuration
"=============================================================================
"" Auto write
set autowrite

"" Auto Close complete preview
augroup AutoCloseCompletePreview
  autocmd!
  autocmd CompleteDone * pclose!
augroup END
