" General Configuration

" Start VIM in no compatibility mode with older VI versions
set nocp

" Turn filetype settings off here and turn them on selectively later
filetype off

" Enforce UTF-8
set encoding=UTF-8

" Line numbers
set number

" Relative numbers
set relativenumber

" Match parentheses
set showmatch

" Enable splitting
set splitright
set splitbelow

" Highlight current line
set cursorline

" Make backspace behaviour consistent and not let it insert random characters in I mode
set backspace=indent,eol,start

" Command history
set history=9999

" Autocomplete commands
set showcmd

" Display the current mode we are in right now
set showmode

" Don't wrap lines
set nowrap

" Set tab to 2 spaces by default
set tabstop=2

" Delete 2 spaces when using backspace
set softtabstop=2

" Autoindent width
set shiftwidth=2

" Use spaces instead of tabs
set expandtab

" Automatically reload the file if it was changed outside vim
set autoread

" Automatically cd into the current working directory
set acd

" Enable paste mode
set paste

" Force fileformats to unix like line endings
set fileformats=unix

" Set a global clipboard
set clipboard=*

" Set a colored line at column 100
set colorcolumn=101

" Show the last status in the status bar
set laststatus=2

" Autoindent
set autoindent

" Copy the previous indent on newline
set copyindent

" Suppress error bells
set novisualbell
set noerrorbells
set vb

" Force mouse enable if the terminal supports it
set mouse=a

" Hide the buffer
set hidden

" Expand the undo history
set undolevels=1000

" If supported, keep an undofile
if v:version >= 730
	set undofile
	set undodir=~/.vim/.undo,~/tmp,/tmp
endif

" Set the terminal title
set title

set wildmode=list:longest,list:full
set wildmenu
set wildignore+=*.o,*.a,*.obj,.git,*.class,*.rbc,*.pyc

syntax on
filetype plugin on
filetype indent on

let mapleader=','
let &showbreak='↪ '

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
let g:NERDTreeShowHidden = 1
map <C-e> :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-surround'

Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'kien/ctrlp.vim'
au FocusGained,BufWritePost * :CtrlPClearCache

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'minimalist'

Plug 'valloric/YouCompleteMe', { 'do': './install.py --all' }

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
nmap s <Plug>(easymotion-s)
omap t <Plug>(easymotion-bd-tl)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

Plug 'tpope/vim-repeat'

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

Plug 'prettier/vim-prettier', {
	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:prettier#config#single_quote = 'true'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:fzf_colors =
	\ { 'fg':		 ['fg', 'Normal'],
	\ 'bg':			 ['bg', 'Normal'],
	\ 'hl':			 ['fg', 'Comment'],
	\ 'fg+':		 ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':		 ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':		 ['fg', 'Statement'],
	\ 'info':		 ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

Plug 'flazz/vim-colorschemes'

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'yggdroot/indentline'
let g:indentLine_setColors = 0
let g:indentLine_char = '|'

if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
	autocmd VimEnter * PlugInstall | q
endif

call plug#end()

augroup auto_reload " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

au FocusLost,WinLeave * :silent! wa
au FocusGained,BufEnter * :silent! !

colorscheme molokai
