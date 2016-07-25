" General config 
set nocompatible                   " Set vi compatibility off
set encoding=utf-8                 " Force UTF-8
set number                         " Line numbers
set backspace=indent,eol,start     " Backspace everything
set history=1000                   " Store :cmdline history
set showcmd                        " Autocomplete commands
set showmode                       " Show mode
set autoread                       " Reload file changes automatically
set hidden                         " No buffers
set visualbell                     " No sounds
set clipboard=unnamed              " Use system clipboard
set paste                          " Toggle paste mode
set fileformats=unix               " Enforce UNIX style line endings
set colorcolumn=100                " Mark 100th column
set laststatus=2                   " Need this for airline  

" Turn syntax highlighting on
syntax on

" Set mapleader to ,
let mapleader=','

" Backups
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
set linebreak

nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Enable mouse if there is support
if has("mouse")
  set mouse=a
endif

" Folding
set foldmethod=indent
set foldcolumn=1
set foldlevelstart=20
set foldnestmax=3
set nofoldenable

" Completion
set wildmode=list:longest
set wildmenu

let g:vim_markdown_folding_disable=1
let perl_fold=1
let php_fold=1
let r_syntax_folding=1
let ruby_fold=1
let sh_fold_enabled=1
let vimsyn_folding='af'
let xml_syntax_folding=1

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " Base vundling
  Plugin 'gmarik/Vundle.vim'
  Plugin 'gmarik/vundle'

  " Mappings
  Plugin 'vim-utils/vim-alt-mappings'

  " Pairing
  Plugin 'L9'
  Plugin 'FuzzyFinder'
  Plugin 'openssl.vim'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'wojtekmach/vim-rename'

  " Fuzzy searches
  Plugin 'kien/ctrlp.vim'

  " Git
  Plugin 'tpope/vim-fugitive'
  Plugin 'vim-scripts/gitignore'

  " Comment management
  Plugin 'tomtom/tcomment_vim'

  " Folding and unfolding
  Plugin 'tmhedberg/SimpylFold'

  " Syntax
  Plugin 'scrooloose/syntastic'

  " Airline status bar
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Themes
  Plugin 'benjaminwhite/Benokai'
  Plugin 'jnurmine/Zenburn'
  Plugin 'altercation/vim-colors-solarized'

  " Languages
  " JS
  Plugin 'othree/yajs.vim', { 'for': 'javascript' }
  Plugin 'othree/es.next.syntax.vim'
  Plugin 'gavocanov/vim-js-indent'
  Plugin 'mxw/vim-jsx'
  Plugin 'elzr/vim-json'
  Plugin 'othree/jsdoc-syntax.vim'
  Plugin 'heavenshell/vim-jsdoc'
  Plugin 'othree/jspc.vim'
  Plugin 'moll/vim-node'

  " YAML
  Plugin 'avakhov/vim-yaml'

  " Go
  Plugin 'fatih/vim-go'

  " Markdown
  Plugin 'plasticboy/vim-markdown'

  " Python
  Plugin 'klen/python-mode'
  Plugin 'lambdalisue/vim-pyenv'
  Plugin 'jmcantrell/vim-virtualenv'
  Plugin 'nvie/vim-flake8'
  Plugin 'vim-scripts/indentpython.vim'

  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-easytags'

  Plugin 'godlygeek/tabular'
  Plugin 'mtth/scratch.vim'
  Plugin 'greplace.vim'
  Plugin 'editorconfig/editorconfig-vim'
  " Nerdtree
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  Plugin 'majutsushi/tagbar'
  Plugin 'Valloric/YouCompleteMe'
call vundle#end()

" Enable Powerline fonts for airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

colorscheme zenburn

" Custom keymaps
nmap <silent> <leader>/ :let @/=''<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Auto reload vimrc on save
augroup auto_reload " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }