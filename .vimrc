
""  Required by Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""  Plugins
Plugin 'gmarik/vundle'
Plugin 'LaTeX-Box-Team/latex-box'
Plugin 'fugitive.vim'
Plugin 'UltiSnips'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
"Plugin 'OmniCppComplete'
Plugin 'tommcdo/vim-exchange'
"Plugin 'vim-scripts/Colour-Sampler-Pack'
" Plugin 'EasyMotion'
Plugin 'unimpaired.vim'
Plugin 'Tabular'
Plugin 'tComment'
Plugin 'Gundo'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'xolox/vim-misc'
"Bundle 'xolox/vim-colorscheme-switcher'

filetype plugin indent on

""  Configuration  

"  UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
noremap <c-tab> :UltiSnipsEdit<Return>

"  Latex-Box
let g:tex_flavor='latex'
let g:tex_conceal= 'adgm'
let g:LatexBox_Folding=0

"  Gundo
nnoremap <F5> :GundoToggle<cr>

"  Nerdtree
nnoremap <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pdf$', '\~$','\.toc$',
            \ '\.fls$','\.bbl$','\.blg$',
            \ '\.out$', '\.log$','\.aux$','\.sty$',
            \ '\.fdb_latexmk$', '\.synctex.gz$','\.latexmain$']

""  Options  

"  Tabs and indent
set smartindent
set nosmarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent

"  Folds
set foldcolumn=0
set foldenable
set foldmethod=expr
set foldlevel=0

"  Search
set hlsearch
set incsearch

"  Back up files
set noswapfile
set nowritebackup
set undofile
set undodir=/home/urbain/.vimundo/

"  Layout window
set number
set ruler
set showcmd
set listchars=tab:▸\ ,eol:¬
set fillchars=fold:\ ,vert:\ ,
set showbreak=...
set colorcolumn=0
set scrolloff=3
set t_Co=256
set guitablabel=%N\ %t\ %M
set background=dark

"  Layout text
set wrap
set linebreak
set textwidth=0
set conceallevel=2
set guifont=Monaco\ 11
try | colorscheme solarized | catch | endtry

"  Case and spell
set nospell
set smartcase
set ignorecase

"  General
set noautochdir
set wildmenu
set cpoptions+=I
set encoding=utf-8


""  Custom mappings

"  Definition of leader and localleader
let mapleader = "\\"
let maplocalleader = "+"

"  Leader maps
nmap <Space> <Leader>
nnoremap <Leader>h :set hlsearch!<cr>
nnoremap <Leader>n :set relativenumber!<cr>
nnoremap <Leader>q :q!<cr>
nnoremap <Leader>sv :source ~/.vimrc<cr>
nnoremap <Leader>sc ;source %
nnoremap <Leader>w :w<cr>
nnoremap <Leader>te :tabedit 
nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>to :tabonly<cr>

"  Other maps
nnoremap <Return> o<Esc>
nnoremap <s-Return> O<Esc>
nnoremap J mzJ`z
nnoremap - za
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap ^ g^
nnoremap gj j
nnoremap gk k
nnoremap g$ $
nnoremap g^ ^

vnoremap j gj
vnoremap k gk
vnoremap $ g$
vnoremap ^ g^
vnoremap gj j
vnoremap gk k
vnoremap g$ $
vnoremap g^ ^
""  Latex  
nmap <buffer> <F2> <Plug>LatexChangeEnv
let g:tex_fast="" 

"  Synctex 
function! LatexEvinceSearch()
    execute "!cd " . LatexBox_GetTexRoot() . '; evince_vim_dbus.py EVINCE "`basename ' . LatexBox_GetOutputFile(). '`" ' . line('.') . ' "%:p"'
endfun

command! LatexEvinceSearch call LatexEvinceSearch()

autocmd FileType tex map <F6> :silent LatexEvinceSearch <Return>
autocmd Filetype tex call SetTexOptions()

"  Layout
hi Cursor guifg=white guibg=blue
hi iCursor guifg=black guibg=green
hi! link conceal normal
" hi! link folded error

""  Functions  
function! Tex_ForwardSearchLaTeX()
    let cmd = 'evince_forward_search ' . fnamemodify(LatexBox_GetMainTexFile(), ":p:r") .  '.pdf ' . line(".") . ' ' . expand("%:p")
    let output = system(cmd)
endfunction

function! SetTexOptions()

    inoremap (( \left(
    inoremap )) \right)
    inoremap {{ \left\{
    inoremap }} \right\}
    inoremap [[ \left[
    inoremap ]] \right]
    inoremap == \,=\,
    inoremap >> \,\geq\,
    inoremap << \,\leq\,
    inoremap ++ \,+\,
    inoremap -- \,-\,

    imap `a \alpha
    imap `b \beta
    imap `g \gamma
    imap `d \delta
    imap `e \varepsilon
    imap `z \zeta
    imap `h \eta
    imap `t \theta
    imap `i \iota
    imap `k \kappa
    imap `l \lambda
    imap `m \mu
    imap `n \nu
    imap `x \xi
    imap `r \rho
    imap `s \sigma
    imap `f \phi
    imap `p \pi
    imap `w \omega

endfunction

""  Autocommands  
augroup autorelead_vimrc
    au! 
    au BufWritePost ~/.vimrc source ~/.vimrc
augroup END

