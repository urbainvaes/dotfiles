"" Plugins
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter', { 'on' : 'GitGutterToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'benekastah/neomake' , { 'for' : 'cpp' }
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'freeo/vim-kalisi'
Plug 'godlygeek/tabular' , { 'on' : 'Tab' }
Plug 'gregsexton/gitv', { 'on' : 'Gitv' }
Plug 'honza/vim-snippets'
Plug 'itchyny/calendar.vim', { 'on' : 'Calendar' }
Plug 'klen/python-mode'
Plug 'jamessan/vim-gnupg', { 'for' : 'asc' }
Plug 'junegunn/fzf'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm', { 'on' : 'T' }
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex' ", { 'for' : 'tex' }
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim', { 'on' : 'Ack' }
Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' , 'on' : 'YcmGenerateConfig' }
Plug 'ryanss/vim-hackernews', { 'on' : 'HackerNews' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'sjl/Gundo.vim', { 'on' : 'GundoToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
Plug 'tommcdo/vim-exchange'
Plug 'ton/vim-bufsurf'
Plug 'tpope/vim-abolish', { 'for' : 'tex' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'troydm/zoomwintab.vim'
Plug 'Valloric/YouCompleteMe', { 'do' : './install.sh --clang-completer' }
Plug 'xolox/vim-misc', { 'on' : 'Note' }
Plug 'xolox/vim-notes', { 'on' : 'Note' }
call plug#end()

let g:vimtex_fold_enabled=0
let g:vimtex_view_method='zathura'
let g:vimtex_latexmk_continuous=1
let g:vimtex_quickfix_mode=0

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
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 0
let g:airline_exclude_preview = 0

let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_echo = 0
let g:bufferline_modified = '+'
let g:bufferline_rotate = 0

let g:ctrlp_by_filename = 1
let g:ctrlp_cmd = 'CtrlP'
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

let g:pymode_rope=0

let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "W"

let g:tagbar_width = 30
let g:tagbar_show_linenumbers=1
let g:tagbar_autofocus=1


let g:tex_conceal= 'adgm'
let g:tex_flavor='latex'
" let g:tex_fast=1

let NERDTreeIgnore=['\.pdf$', '\~$','\.toc$',
            \ '\.fls$','\.bbl$','\.blg$',
            \ '\.out$', '\.log$','\.aux$','\.sty$',
            \ '\.fdb_latexmk$', '\.synctex.gz$','\.latexmain$']

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = ['re!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*' ]

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

let g:tabprefix = ""


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
set diffopt=filler,vertical
set listchars=tab:▸\ ,eol:¬,trail:-
set fillchars=fold:\ ,vert:\ ,
set breakindent
let &showbreak='--> '
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
set formatprg=par\ w72
set guifont=Monaco\ 11

" Case and spell
set nospell
" set spellfile="/home/urbain/.vim/spell/en.utf-8.add"
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
if $COLORSCHEME=="light"
    silent! colo solarized
    set background=light
elseif $COLORSCHEME=="dark"
    silent! colo solarized
    set background=dark
elseif $COLORSCHEME=="default"
    silent! colo seoul256
    set background=dark
endif

highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

"" Maps

" Definition of leaders
let mapleader = " "
let maplocalleader = "\\"

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
nnoremap cof :set foldenable!<cr>
nnoremap cpg :GitGutterToggle<cr>
nnoremap cpn :NERDTreeToggle<cr>
nnoremap cpt :TagbarToggle<cr>
nnoremap cpu :GundoToggle<cr>

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
nnoremap <Leader>gv :Gitv<cr>

" Misc
nnoremap <tab> <C-^>
nnoremap Q :bd!<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q!<cr>
nnoremap <LocalLeader>h :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
nnoremap J mzJ`z
nnoremap Y y$
nnoremap + za
nnoremap K :OnlineThesaurusCurrentWord<CR>

" Dvorak specific
nnoremap : ,
vnoremap : ,
nnoremap , :
vnoremap , :

" Neovim specific
if has("nvim")
    tnoremap <C-_> <C-\><C-n><C-^>:ZoomWinTabOut<cr>
    nnoremap <C-_> :ZoomWinTabIn<cr>:b term<cr>i
    inoremap <C-_> <Esc>:b term<cr>i
    nnoremap ym :Neomake!<cr>
endif

"" Restore cursor position
augroup vimrc
    au!
    autocmd BufWritePost *vimrc source %
    autocmd BufWritePost *.cpp Neomake!
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

"" Taken from Junegunn Chong
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':     'colo',
\   'options':  '+m',
\   'left':     30,
\   'launcher': 'iterm2-launcher 20 30 %s'
\ })<CR>

"" Experimental
let g:notes_directories = ['~/dotfiles/notes']

" Idea: instant download colorscheme
