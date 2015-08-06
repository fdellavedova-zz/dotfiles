
call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite-outline'
Plug 'Shougo/vimfiler.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'chriskempson/base16-vim'
Plug 'jdkanani/vim-material-theme'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala'}
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'kshenoy/vim-signature'
Plug 'tmhedberg/SimpylFold'
Plug 'myusuf3/numbers.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
" nmap <leader>w :w!<cr>

" Easy copying from vim to other program
set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
set number

" Enable mouse
set mouse=a

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
" set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" For regular expressions turn magic on
" set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Omni completion
set omnifunc=syntaxcomplete

" All folds open when opening a file
set foldlevel=99

" highlight current line in insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" easier code block indentation
vnoremap < <gv
vnoremap > >gv

" Ctrl+r to search for the highlighted text in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" close the preview window for autocompletion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" easy pane switching Alt+arrow 
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" different color after 80th column
let &colorcolumn=join(range(81,999),",")

""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
set t_Co=256
syntax enable
set background=dark
" Access colors present in 256 colorspace
let base16colorspace=256  
colorscheme base16-paraiso

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T  " remove menu bar
    set guioptions-=m  " remover toolbar
    set guioptions-=r  " remove right-hand scrollbar
    set guioptions-=L  " remove left-hand scrollbar
    highlight Pmenu guibg=#cccccc gui=bold    
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=monofur\ 14
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Keep tarminal transparency
hi Normal ctermbg=none

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" Python-style folding
set foldmethod=indent

" Split opening more natural
set splitbelow
set splitright

""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
  
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""
" use ; and avoid holding shift
nore ; :

map <C-h> <C-w>h                " Easy window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> <leader>/ :nohlsearch<CR> " clean up search highlighting

""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

" trim white spacec on save"
autocmd BufWritePre *.py normal m`:%s/\s\+$//e `` 
"" Auto Commands
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``  " trim white spacec on save"

""""""""""""""""""""""""""""""""""""""""""
" => Plugin-specific configuration
""""""""""""""""""""""""""""""""""""""""""
" Airline
set laststatus=2
let g:airline_theme  = 'base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = '\%(.pyc\|.ropeproject\|__pycache__\|\.git\)$'

" Python Mode
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace();   ## XXX  BREAKPOINT'
let g:pymode_lint_on_fly = 1
let g:pymode_rope_completion = 0
let g:pymode_lint_cwindow = 0

" Emmet
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,htmldjango EmmetInstall

" NERD Commenter
let NERDSpaceDelims = 1 

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" call unite#custom#profile('buffer', 'ignorecase', 1)
call unite#custom#profile('default', 'context', {'prompt': '>> ', 'winheight': 15})
call unite#custom#source('default', 'filters', ['matcher_hide_hidden_files'])

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    \ 'ignore_pattern', join([
    \ '\.git/',
    \ '\.ropeproject/',
    \ '.pyc',
    \ ], '\|'))
call unite#custom_source('file_mru', 'max_candidates', 4)
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = "~/.unite"

" General fuzzy search
nnoremap <silent> <space><space> :<C-u>Unite -buffer-name=files buffer bookmark file_rec/async file_mru file/new directory/new<CR>
" Quick registers
nnoremap <silent> <leader>r :<C-u>Unite -buffer-name=register register<CR>
" Quick yank history
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>
" Quick outline
nnoremap <silent> <leader>o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
" Quick sources
nnoremap <silent> <leader>a :<C-u>Unite -buffer-name=sources source<CR>
" Quickly switch lcd
nnoremap <silent> <leader>d :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>
" Quick grep from cwd
nnoremap <silent> <leader>g :<C-u>Unite -buffer-name=grep grep:.<CR>
" Quick line using the word under cursor
" nnoremap <silent> <leader>l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>
" Quick line
nnoremap <silent> <leader>l :<C-u>Unite -buffer-name=search_file line<CR>
" Quick MRU search
nnoremap <silent> <leader>m :<C-u>Unite -buffer-name=mapping mapping<CR>
" Quick find
nnoremap <silent> <leader>f :<C-u>Unite -buffer-name=find find:.<CR>
" Quick commands
nnoremap <silent> <leader>c :<C-u>Unite -buffer-name=commands command<CR>
" Vimfiler
nnoremap <silent> <leader><space> :VimFiler<CR>

let g:UltiSnipsExpandTrigger='<c-l>'
