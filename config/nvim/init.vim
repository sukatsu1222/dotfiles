"=============================================================================
"" dein.vim
"=============================================================================
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  let s:toml = expand('~/.config/nvim/dein.toml')

  call dein#begin(s:dein_dir, expand('<sfile>'))

  call dein#load_toml(s:toml, {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

"" Install plugins
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

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
colorscheme solarized
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
