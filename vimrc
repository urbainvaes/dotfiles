"" Required by vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Plugins
Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'freeo/vim-kalisi'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/gitv'
Plugin 'honza/vim-snippets'
Plugin 'jamessan/vim-gnupg'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/fzf' 
Plugin 'kien/ctrlp.vim'
Plugin 'LaTeX-Box-Team/latex-box'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/Gundo.vim'
Plugin 'szw/vim-ctrlspace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'
Plugin 'tommcdo/vim-exchange'
Plugin 'ton/vim-bufsurf'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'troydm/zoomwintab.vim'
Plugin 'Valloric/YouCompleteMe'

filetype plugin indent on
syntax on

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
let g:UltiSnipsSnippetsDir="~/.nvim/mySnippets"

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_c = '%f%m'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%%|%3l|%3c'
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 0
let g:airline_exclude_preview = 0

let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_echo = 0
let g:bufferline_modified = '+'
let g:bufferline_rotate = 0

nnoremap <a-p> :CtrlPMRUFiles<cr>
let g:ctrlp_by_filename = 1
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-n>'],
    \ 'PrtSelectMove("k")':   ['<c-p>'],
    \ 'PrtHistory(-1)':       ['<c-j>'],
    \ 'PrtHistory(1)':        ['<c-k>'],}

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

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 1

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
nnoremap <Leader>pi :PluginInstall<cr>
nnoremap <Leader>pu :PluginUpdate<cr>
nnoremap <Leader>pc :PluginClean<cr>
nnoremap <Leader>ps :PluginSearch<cr>

" Toggles
nnoremap cop :set paste!<cr>
nnoremap <Leader>tg :GitGutterToggle<cr>
nnoremap <Leader>tn :NERDTreeToggle<cr>
nnoremap <Leader>tt :TagbarToggle<cr>
nnoremap <Leader>tu :GundoToggle<cr>

" Sourcing
nnoremap <Leader>sv :source ~/.vimrc<cr>
nnoremap <Leader>sc :source %<cr>

" File edits
nnoremap <Leader>es :UltiSnipsEdit<cr>
nnoremap <Leader>em :e ~/dotfiles/mutt/muttrc<cr>
nnoremap <Leader>en :e ~/dotfiles/nvimrc<cr>
nnoremap <Leader>ev :e ~/dotfiles/vimrc<cr>
nnoremap <Leader>ez :e ~/dotfiles/zshrc<cr>
nnoremap <Leader>et :e ~/dotfiles/tmux.conf<cr>

" Formatting
nnoremap <Leader>fw :%s/\s\+$//<cr>
nnoremap <Leader>fi zzmxgg=G'x

" Navigation
nnoremap (( :BufSurfBack<CR>
nnoremap )) :BufSurfForward<CR>
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

"" Experimental
augroup cursorPosition
    au!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

if has('nvim')
    tmap jk <C-\><C-n>
endif
