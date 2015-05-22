"" Plugins
call plug#begin('~/.nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'freeo/vim-kalisi'
Plug 'godlygeek/tabular'
Plug 'gregsexton/gitv'
Plug 'honza/vim-snippets'
Plug 'jamessan/vim-gnupg'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/seoul256.vim'
Plug 'kien/ctrlp.vim'
Plug 'LaTeX-Box-Team/latex-box'
Plug 'majutsushi/tagbar'
Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'sjl/Gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe' , { 'for' : 'cpp' }
call plug#end()

"" Plugins options
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
let g:airline_section_c = '%f%m'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%%|%3l|%3c'
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 0

let g:buffergator_display_regime='bufname'
let g:buffergator_vsplit_size=30

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
nnoremap <a-p> :CtrlPMRUFiles<cr>

let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"

let g:tagbar_width = 30
let g:tagbar_show_linenumbers=1

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
set nofoldenable
set foldmethod=expr
set foldlevel=0

" Back up files
set noswapfile
set nowritebackup
set undofile
set undodir=/home/urbain/.nvim/vimundo/

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
set hidden

" Colorscheme
try | colorscheme solarized | catch | endtry
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

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
nnoremap <Leader>pi :PlugInstall<cr>
nnoremap <Leader>pu :PlugUpdate<cr>
nnoremap <Leader>pc :PlugClean<cr>
nnoremap <Leader>pd :PlugDiff<cr>
nnoremap <Leader>ps :PlugStatus<cr>

" Toggles
nnoremap cop :set paste!<cr>
nnoremap <Leader>tb :BuffergatorToggle<cr>
nnoremap <Leader>tg :GitGutterToggle<cr>
nnoremap <Leader>tn :NERDTreeToggle<cr>
nnoremap <Leader>tt :TagbarToggle<cr>
nnoremap <Leader>tu :GundoToggle<cr>

" Sourcing
nnoremap <Leader>sv :source ~/.vimrc<cr>
nnoremap <Leader>sc :source %<cr>

" File edits
nnoremap <Leader>es :UltiSnipsEdit<cr>
nnoremap <Leader>em :e ~/.mutt/muttrc<cr>
nnoremap <Leader>en :e ~/.nvimrc<cr>
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

" Commands
nnoremap ym :Neomake!<cr>
nnoremap <c-w>o :mksession! ~/tmp.vim<cr><c-w>o
nnoremap <c-w>r :source ~/tmp.vim<cr>

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

" Neovim specific
tmap <C-_> <C-\><C-n><C-^>
nnoremap <C-_> :b term<cr>i
inoremap <C-_> <Esc><C-^>i

"" Restore cursor position
augroup autocommands
    autocmd BufWritePost *.cpp Neomake!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END
