set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Vim Airline: lean & mean status/tabline for vim that's light as air
Plugin 'bling/vim-airline'

" Multiple Cursors: True Sublime Text style multiple selections for Vim
Plugin 'terryma/vim-multiple-cursors'

" Fugitive Vim: a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" NERDcommenter: Vim plugin for intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter'

" NerdTree: A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'

" SearchComplete: Tab completion of words inside of a search ('/')
Plugin 'vim-scripts/SearchComplete'

" Toggle Mouse: Toggles the mouse focus between Vim and your terminal emulator, allowing terminal emulator mouse commands, like copy/paste
Plugin 'nvie/vim-togglemouse'

" CtrlP: Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'kien/ctrlp.vim'

" Vim PythonMode: PyLint, Rope, Pydoc, breakpoints from box
Plugin 'klen/python-mode'

" Colors: one colorscheme pack to rule them all!
Plugin 'flazz/vim-colorschemes'

" DeliMate: provides insert mode auto-completion for quotes, parens, brackets
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"" custom settings
set t_Co=256
syntax enable
set background=dark
colorscheme Tomorrow-Night-Eighties 
"set nu                          " Turn on line numbering. Turn it off with 'set nonu'
"syntax on                       " Set syntax on
set tabstop=4                   " a tab is four spaces
set copyindent                  " copy the previous indentation on autoindenting
set autoindent                  " always set autoindenting on
filetype indent on              " Indent automatically depending on filetype
set mouse=a                     " automatically enable mouse usage
set foldlevel=99				  " don't fold code when opening a file
" set virtualedit=onemore         " allow for cursor beyond last
" set showmode                    " display the current mode
" set cursorline                  " highlight current line
" set ic                          " Case insensitive search
" set hls                         " Higlhight search
" set lbr                         " Wrap text instead of being on one line
" colorscheme delek               " Change colorscheme from default to delek
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four
" set backspace=indent,eol,start  " allow backspacing over everything in insert mode
" set number                      " always show line numbers
" set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
" set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
" set nobackup
" set noswapfile
" filetype plugin indent on       " use plugins that make sense for the file
" set list                        " trail whitespaces
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

"" keys remapping
nore ; :                    " use ; and avoid holding shift

map <C-h> <C-w>h                " Easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <leader>/ :nohlsearch<CR> " clean up search highlighting

"" Auto Commands
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``  " trim white spacec on save"

" Leader Key
let mapleader = ","

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme  = 'tomorrow'
set laststatus=2

""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""
nmap <leader>ne :NERDTree<cr>
