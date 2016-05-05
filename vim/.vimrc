"" Definition of leaders
let mapleader = " "
let maplocalleader = "\\"


"" Plugins
call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'critiqjo/lldb.nvim'
Plug 'holomorph/vim-freefem'
Plug 'honza/vim-snippets'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
Plug 'justinmk/vim-sneak'
Plug 'klen/python-mode'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'rdnetto/YCM-Generator', { 'branch' : 'stable' , 'on' : 'YcmGenerateConfig' }
Plug 'scrooloose/nerdtree'
Plug 'sjl/Gundo.vim', { 'on' : 'GundoToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'troydm/zoomwintab.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/gmsh.vim'

if has("nvim")
    Plug 'Shougo/deoplete.nvim'
    Plug 'benekastah/neomake'
else
    Plug 'Shougo/neocomplete.vim'
    Plug 'scrooloose/syntastic'
    " Plug 'Valloric/YouCompleteMe', { 'do' : 'python2 install.py --clang-completer' }
endif

call plug#end()


"" Plugin mappings

" Toggles
nnoremap cpg :GitGutterToggle<cr>
nnoremap cpn :NERDTreeToggle<cr>
nnoremap cpt :TagbarToggle<cr>
nnoremap cpu :GundoToggle<cr>

" Fuzzy finder
nnoremap <c-p>b  :Buffers<cr>
nnoremap <c-p>f  :Files<cr>
nnoremap <c-p>r  :History<cr>
nnoremap <c-p>g  :GitFiles<cr>
nnoremap <c-p>c  :Colors<cr>
nnoremap <c-p>h  :History:<cr>

imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-file)

" LLDB
nnoremap <c-d>n :LLsession new
nnoremap <c-d>b <Plug>LLBreakSwitch
nnoremap <c-d>c :LL continue<cr>
nnoremap <c-d>d :LLmode debug<cr>
nnoremap <c-d>z :LLmode code<cr>
nnoremap <c-d>l :LL process launch<cr>
nnoremap <c-d>p :LL print <C-R>=expand('<cword>')<CR>
vnoremap <c-d>p :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

" Fugitive
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gd :Gdiff<cr>

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap gl <Plug>(LiveEasyAlign)
nmap gl <Plug>(LiveEasyAlign)

" Online thesaurus
nnoremap cpd :OnlineThesaurusCurrentWord<cr>

" Ultisnips
nnoremap cps :UltiSnipsEdit<cr>

" Neomake
nnoremap gm :Neomake!<cr>


"" Plugin configurations

" Airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'mixed-indent-file' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0

" Deoplete / neocomplete
let g:deoplete#enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1
let g:deoplete#omni#input_patterns={}
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.ledger = ':\w*'
let g:deoplete#omni#input_patterns.tex = ['cite.\w*', 'ref.\w*']

" FZF.vim
let g:fzf_buffers_jump = 1

" NerdTree
let g:NERDTreeHijackNetrw = 0

" Python-mode
let g:pymode_rope=0

" Tagbar
let g:tagbar_width = 30
let g:tagbar_show_linenumbers = 1
let g:tagbar_autofocus = 1

" Syntastic
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "W"

" Ultisnips
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mySnippets']
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"

" Vimtex
let g:vimtex_fold_enabled=0
let g:vimtex_view_method='zathura'
let g:vimtex_latexmk_continuous=1
let g:vimtex_quickfix_mode=0
let g:vimtex_latexmk_build_dir='build'
let g:vimtex_latexmk_progname='nvr'

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
    let g:ycm_semantic_triggers.tex = ['re!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*' ]
endif


"" Vim variables
let g:netrw_bufsettings='relativenumber'
let g:tex_conceal= 'adgm'
let g:tex_flavor='latex'


"" Vim options
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showcmd
set nofoldenable
set noswapfile
set nowritebackup
set undofile
set diffopt=filler,vertical
set nowrap
set conceallevel=2
set nojoinspaces
set nospell
set smartcase
set ignorecase
set lazyredraw
set hidden
set encoding=utf-8 " Makes it slow to source
silent! set breakindent
let &showbreak='--> '
" set clipboard=unnamedplus
" set spellfile="$HOME/.vim/spell/en.utf-8.add"


"" Mappings
nnoremap <Leader>w :w!<cr>
nnoremap <Leader>q :q!<cr>
nnoremap <Leader>d :bd!<cr>
nnoremap <Leader>t :tabnew<cr>

nnoremap got :call system('urxvt -cd '.getcwd().' &')<cr>
nnoremap goT :call system('urxvt -cd '.expand("%:p:h").' &')<cr>

nnoremap <tab> <C-^>
nnoremap <LocalLeader>h :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
nnoremap Y y$
nnoremap + za
nnoremap <BS> <C-W>h
nnoremap <Leader>fw :%s/\s\+$//<cr>


"" Colorscheme
let base16colorspace=256
let g:seoul256_background =235
silent! colo $COLORSCHEME
if $BACKGROUND=="dark"
    set background=dark
elseif $BACKGROUND=="light"
    set background=light
endif


"" Autocommands
augroup vimrc
    autocmd!
    au BufNewFile,Bufread /tmp/mutt-* setlocal tw=72
    au BufNewFile,BufRead *.edp comp freefem
    au BufNewFile,BufRead *.geo setf gmsh
augroup END
