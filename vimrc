"" Required by vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Plugins
Plugin 'gmarik/vundle'
Plugin 'LaTeX-Box-Team/latex-box'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/gitv'
Plugin 'honza/vim-snippets'
Plugin 'jamessan/vim-gnupg'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/Gundo.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
filetype plugin indent on
syntax on

"" Plugins options
let g:buffergator_display_regime='bufname'
let g:buffergator_vsplit_size=30

let g:LatexBox_Folding=0
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
let g:LatexBox_viewer='zathura'

let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mySnippets']
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = '%f%m'
let g:airline_section_z = '%3p%%|%3l|%3c'
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 0

let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_echo = 0
let g:bufferline_modified = '+'
let g:bufferline_rotate = 0

let g:ctrlp_by_filename = 1
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'r'

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:tex_conceal= 'adgm'
let g:tex_flavor='latex'
let g:tex_fast=""

let g:tmuxline_preset = {'a':'#H','b':'#S','win':'#W','cwin':'#W','x':'%R','y':'%a','z':'%Y'}
let g:tmuxline_separators = {'left':'','left_alt':'>','right':'','right_alt':'<','space':' '}
let g:tmuxline_theme='airline'

let NERDTreeIgnore=['\.pdf$', '\~$','\.toc$',
            \ '\.fls$','\.bbl$','\.blg$',
            \ '\.out$', '\.log$','\.aux$','\.sty$',
            \ '\.fdb_latexmk$', '\.synctex.gz$','\.latexmain$']

"" Vim options

" Tabs and indent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Folds
set foldcolumn=0
set foldenable
set foldmethod=expr
set foldlevel=0

" Back up files
set noswapfile
set nowritebackup
set undofile
set undodir=/home/urbain/.vim/vimundo/

" Layout window
set nonumber
set listchars=tab:▸\ ,eol:¬,trail:-
set fillchars=fold:\ ,vert:\ ,
set showbreak=--▸\ ,
set breakindent
set colorcolumn=0
set scrolloff=0
set t_Co=256
set guitablabel=%N\ %t\ %M
set showcmd

" Layout text
set nowrap
set linebreak
set textwidth=0
set conceallevel=2
set formatprg=par\ w70
set guifont=Monaco\ 11

" Case and spell
set nospell
set spellfile="/home/urbain/.vim/spell/en.utf-8.add"
set smartcase
set ignorecase

" Misc
set noautochdir
set cpoptions+=Iq
set encoding=utf-8
set mouse=a
set clipboard=unnamedplus
set lazyredraw

" Colorscheme
try | colorscheme solarized | catch | endtry

"" Maps

" Definition of leaders
let mapleader = "\\"
let maplocalleader = "-"
nmap <Space> <Leader>

" New pages
nnoremap <Leader>pe :tabedit
nnoremap <Leader>pn :tabnew<cr>
nnoremap <Leader>po :tabonly<cr>

" Plugin Management
nnoremap <Leader>pi :PluginInstall<cr>
nnoremap <Leader>pu :PluginUpdate<cr>
nnoremap <Leader>pc :PluginClean<cr>
nnoremap <Leader>ps :PluginSearch<cr>

" Toggles
nnoremap cop :set paste!<cr>
nnoremap <Leader>tg :GitGutterToggle<cr>
nnoremap <Leader>tt :NERDTreeToggle<cr>
nnoremap <Leader>tu :GundoToggle<cr>

" Sourcing
nnoremap <Leader>sv :source ~/.vimrc<cr>
nnoremap <Leader>sc :source %<cr>

" File edits
nnoremap <Leader>es :UltiSnipsEdit<cr>
nnoremap <Leader>ev :e ~/.vimrc<cr>
nnoremap <Leader>ez :e ~/.zshrc<cr>
nnoremap <Leader>et :e ~/.tmux.conf<cr>

" Formatting
nnoremap <Leader>fw :%s/\s\+$//<cr>
nnoremap <Leader>fi zzmxgg=G'x

" Navigation
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>
nnoremap <Return> o<Esc>
nnoremap <s-Return> O<Esc>

" Git
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gd :Gdiff<cr>

" Misc
nnoremap <tab> <C-^>
nnoremap Q :bd!<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q!<cr>
nnoremap <LocalLeader>h :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
nnoremap J mzJ`z
nnoremap Y y$
nnoremap + za

" Dvorak specific
nnoremap : ,
vnoremap : ,
nnoremap , :
vnoremap , :

"" Neovim specific
if has('nvim')
    tmap jk <C-\><C-n>
endif
