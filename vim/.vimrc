" Definition of leaders
let mapleader = " "
let maplocalleader = "\\"

"" Plugins
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-online-thesaurus'
nnoremap K :OnlineThesaurusCurrentWord<CR>

Plug 'christoomey/vim-tmux-navigator'
Plug 'embear/vim-localvimrc'
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

Plug 'gregsexton/gitv', { 'on' : 'Gitv' }
Plug 'honza/vim-snippets'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:fzf_buffers_jump = 1
if has("nvim")
    nnoremap <a-b>  :Buffers<cr>
    nnoremap <a-f>  :Files<cr>
    nnoremap <a-r>  :History<cr>
    nnoremap <a-g>  :GitFiles<cr>
    nnoremap <a-c>  :Colors<cr>
    nnoremap <a-h>  :History:<cr>
endif
nnoremap <c-p>b  :Buffers<cr>
nnoremap <c-p>f  :Files<cr>
nnoremap <c-p>r  :History<cr>
nnoremap <c-p>g  :GitFiles<cr>
nnoremap <c-p>c  :Colors<cr>
nnoremap <c-p>h  :History:<cr>

imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-file)

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap gl <Plug>(LiveEasyAlign)
nmap gl <Plug>(LiveEasyAlign)

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'mixed-indent-file' ]
let g:airline_theme='base16'

Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'justinmk/vim-sneak'
Plug 'klen/python-mode'
let g:pymode_rope=0

Plug 'lervag/vimtex'
let g:vimtex_fold_enabled=0
let g:vimtex_view_method='zathura'
let g:vimtex_latexmk_continuous=1
let g:vimtex_quickfix_mode=0
let g:vimtex_latexmk_build_dir='build'
let g:vimtex_latexmk_progname='nvr'

Plug 'majutsushi/tagbar'
let g:tagbar_width = 30
let g:tagbar_show_linenumbers = 1
let g:tagbar_autofocus = 1

Plug 'mileszs/ack.vim', { 'on' : 'Ack' }
Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' , 'on' : 'YcmGenerateConfig' }
Plug 'scrooloose/nerdtree'
let g:NERDTreeHijackNetrw = 0

Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mySnippets']
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"
let g:UltiSnipsUsePythonVersion=3
nnoremap <Leader>es :UltiSnipsEdit<cr>

Plug 'sjl/Gundo.vim', { 'on' : 'GundoToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
Plug 'tommcdo/vim-exchange'
Plug 'ton/vim-bufsurf'
nnoremap (( :BufSurfBack<CR>
nnoremap )) :BufSurfForward<CR>

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gv :Gitv<cr>

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'troydm/zoomwintab.vim'
Plug 'vim-scripts/gmsh.vim'
Plug 'holomorph/vim-freefem'
Plug 'nanotech/jellybeans.vim'

if has("nvim")
    Plug 'benekastah/neomake'
    let g:neomake_freefem_ff_maker = {
                \ 'exe': 'FreeFem++',
                \ 'args': '-ne',
                \ 'errorformat': ' Error line number %l\, in file %f\,%m',
                \ }
    nnoremap gm :Neomake!<cr>

    Plug 'Shougo/deoplete.nvim'
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#omni#input_patterns={}
    let g:deoplete#omni#input_patterns.ledger = ':\w*'
    let g:deoplete#omni#input_patterns.tex = ['cite.\w*', 'ref.\w*']
else
    Plug 'Valloric/YouCompleteMe', { 'do' : 'python2 install.py --clang-completer' }
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_auto_trigger = 1
    if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
        let g:ycm_semantic_triggers.tex = ['re!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*' ]
    endif

    Plug 'scrooloose/syntastic'
    let g:syntastic_cpp_compiler = "g++"
    let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
    let g:syntastic_error_symbol = "✗"
    let g:syntastic_warning_symbol = "W"
endif
call plug#end()

let g:tex_conceal= 'adgm'
let g:tex_flavor='latex'

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
set undodir=$HOME/.vim/vimundo/

" Layout window
set nonumber
set diffopt=filler,vertical
set listchars=tab:▸\ ,eol:¬,trail:-
set fillchars=fold:\ ,vert:\ ,
set breakindent
let &showbreak='--> '
set colorcolumn=0
set scrolloff=0
set guitablabel=%N\ %t\ %M
set showcmd

" Layout text
set nowrap
set linebreak
set textwidth=0
set conceallevel=2
set guifont=Monaco\ 11
set nojoinspaces

" Case and spell
set nospell
" set spellfile="$HOME/.vim/spell/en.utf-8.add"
set smartcase
set ignorecase

" Misc
set clipboard=unnamedplus
set noautochdir
set cpoptions+=Iq
set encoding=utf-8
set mouse=a
set lazyredraw
set hidden

" mutt
au BufNewFile,Bufread /tmp/mutt-* setlocal tw=72
au BufNewFile,BufRead *.edp comp freefem
au BufNewFile,BufRead *.geo setf gmsh

" Colorscheme
let base16colorspace=256
" let g:seoul256_background =235
silent! colo $COLORSCHEME
if $BACKGROUND=="dark"
    set background=dark
elseif $BACKGROUND=="light"
    set background=light
endif

highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

"" Maps

" Toggles
nnoremap cop :set paste!<cr>
nnoremap cof :set foldenable!<cr>
nnoremap cpg :GitGutterToggle<cr>
nnoremap cpn :NERDTreeToggle<cr>
nnoremap cpt :TagbarToggle<cr>
nnoremap cpu :GundoToggle<cr>

" Formatting
nnoremap <Leader>fw :%s/\s\+$//<cr>

" Navigation
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>
nnoremap <Return> o<Esc>

" Misc
nnoremap <tab> <C-^>
nnoremap Q :bd!<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q!<cr>
nnoremap <LocalLeader>h :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
nnoremap J mzJ`z
nnoremap Y y$
nnoremap + za

" Neovim specific
if has("nvim")
    tnoremap <C-_> <C-\><C-n><C-^>:ZoomWinTabOut<cr>
    nnoremap <C-_> :ZoomWinTabIn<cr>:b term<cr>i
    inoremap <C-_> <Esc>:b term<cr>i
    nnoremap <a-w>  :w<cr>
    nnoremap <a-d>  :q<cr>
    nnoremap <a-t>  :tabnew<cr>
    nmap <BS> <C-W>h
endif
