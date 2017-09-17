"" Download vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = " "
let maplocalleader = "\\"

"" Plugins
call plug#begin('~/.vim/plugged')
Plug 'LnL7/vim-nix'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'critiqjo/lldb.nvim'
Plug 'embear/vim-localvimrc'
Plug 'holomorph/vim-freefem'
Plug 'honza/vim-snippets'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/heytmux'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'klen/python-mode'
Plug 'kshenoy/vim-signature'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-startify'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'sjl/Gundo.vim', { 'on' : 'GundoToggle' }
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
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
Plug 'troydm/zoomwintab.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/SpellCheck'
Plug 'vim-scripts/gmsh.vim'
" Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

if has("nvim")
    Plug 'Shougo/deoplete.nvim'
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'jalvesaq/Nvim-R'
else
    Plug 'Shougo/neocomplete.vim'
endif

call plug#end()

"" Plugin mappings

" Toggles
nnoremap cpg :GitGutterToggle<cr>
nnoremap cpn :NERDTreeToggle<cr>
nnoremap cpt :TagbarToggle<cr>
nnoremap cpu :GundoToggle<cr>

" Fuzzy finder
nnoremap <c-p>a  :Ag
nnoremap <c-p>b  :Buffers<cr>
nnoremap <c-p>c  :Commands<cr>
nnoremap <c-p>f  :Files<cr>
nnoremap <c-p>g  :GitFiles<cr>
nnoremap <c-p>r  :History<cr>
nnoremap <c-p>:  :History:<cr>
nnoremap <c-p>/  :History/<cr>
nnoremap <c-p>l  :BLines<cr>
nnoremap <c-p>m  :Marks<cr>
nnoremap <c-p>t  :Tags<cr>

imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-file)

" LLDB
nnoremap <c-d>n :LLsession new<cr>
nnoremap <c-d>b <Plug>LLBreakSwitch
nnoremap <c-d>c :LL continue<cr>
nnoremap <c-d>d :LLmode debug<cr>
nnoremap <c-d>z :LLmode code<cr>
nnoremap <c-d>l :LL process launch<cr>
nnoremap <c-d>p :LL print <C-R>=expand('<cword>')<CR>
vnoremap <c-d>p :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

" Fugitive
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gc :Gcommit<cr>
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

function! OnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if OnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

"" Plugin configurations

" Airline
let g:airline_theme='nord'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'mixed-indent-file' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.whitespace = ''

" Deoplete / neocomplete
let g:deoplete#enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1
if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
    \ '\v\\%('
    \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|%(include%(only)?|input)\s*\{[^}]*'
    \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . ')'
let g:deoplete#omni_patterns.tex = g:neocomplete#sources#omni#input_patterns.tex.'\m'

" FZF.vim
let g:fzf_buffers_jump = 1

" Gundo
let g:gundo_prefer_python3 = 1

" Idealvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist='/home/*'

" NerdTree
let g:NERDTreeHijackNetrw = 0

" Python-mode
let g:pymode_rope=0

" Tagbar
let g:tagbar_width = 30
let g:tagbar_show_linenumbers = 1
let g:tagbar_autofocus = 1

" Sneak
let g:sneak#use_ic_scs = 1

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
let g:UltiSnipsUsePythonVersion=3

" Vimtex
let g:vimtex_fold_enabled=0
let g:vimtex_view_method='zathura'
let g:vimtex_latexmk_continuous=1
let g:vimtex_quickfix_mode=2
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

" Plugins interactions
function! Multiple_cursors_before()
    if has("nvim")
        let b:deoplete_disable_auto_complete = 1
    else
        exe 'NeoCompleteLock'
    endif
endfunction

function! Multiple_cursors_after()
    if has("nvim")
        let b:deoplete_disable_auto_complete = 0
    else
        exe 'NeoCompleteUnlock'
    endif
endfunction

"" Vim variables
let g:netrw_bufsettings='relativenumber'
let g:tex_conceal= ''
let g:tex_flavor='latex'

"" Vim options
set complete+=k
set cursorline
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showcmd
set foldmethod=marker
set noswapfile
set nowritebackup
set undodir=~/.vim/vimundo/
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
" set formatoptions+=orw
silent! set breakindent
let &showbreak='--> '
set clipboard=unnamedplus
" set spellfile="$HOME/.vim/spell/en.utf-8.add"
if !has("nvim")
  set encoding=utf-8
endif
if has("nvim")
  set inccommand=split
endif


"" Mappings
nnoremap <silent> <Plug>AddWhiteSpaceAfter a <Esc>h:silent call repeat#set("\<Plug>AddWhiteSpaceAfter")<cr>
nnoremap <silent> <Plug>AddWhiteSpaceBefore i <Esc>l:silent call repeat#set("\<Plug>AddWhiteSpaceBefore")<cr>

nmap ]w <Plug>AddWhiteSpaceAfter
nmap [w <Plug>AddWhiteSpaceBefore

nnoremap <Leader>w :update<cr>
nnoremap <Leader>q :q!<cr>
nnoremap <Leader>d :bd!<cr>

nmap gs :set opfunc=Search<cr>g@
xmap gs :<c-u>call Search(visualmode())<cr>
function! Search(vm)
    let is_visual=(a:vm == "v")
    let l=getline(is_visual ? "'<" : "'[")
    let [line1,col1] = getpos(is_visual ? "'<" : "'[")[1:2]
    let [line2,col2] = getpos(is_visual ? "'>" : "']")[1:2]
    call feedkeys(':Grepper -tool git -query "' . l[col1 - 1: col2 - 1] . '"')
endfunction

nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>te :tabedit
nnoremap <Leader>th :-tabmove<cr>
nnoremap <Leader>tl :+tabmove<cr>
nnoremap <Leader>tm :tabmove
nnoremap <Leader>t0 :tabmove 0<cr>
nnoremap <Leader>t$ :tabmove<cr>

nnoremap cqo :copen<cr>
nnoremap cqc :cclose<cr>

nnoremap got :call system('urxvt -cd '.getcwd().' &')<cr>
nnoremap goT :call system('urxvt -cd '.expand("%:p:h").' &')<cr>
nnoremap gof :call system('urxvt -e vifm '.getcwd().' '.getcwd().' &')<cr>
nnoremap goF :call system('urxvt -e vifm '.expand("%:p:h").' '.expand("%:p:h").' &')<cr>

nnoremap <LocalLeader>h :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
nnoremap Y y$
nnoremap + za
nnoremap <BS> <C-W>h

nnoremap <Leader>fw :%s/\s\+$//<cr>
nnoremap <Leader>ft :%s/^	\+//g<cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <up> <c-p>
cnoremap <down> <c-n>

"" Colorscheme
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
    au BufNewFile,BufRead *.geo,*.msh setf gmsh
    au BufNewFile,BufRead *.pde setf freefem
    au BufNewFile,BufRead *.plt setf gnuplot
    au FileType gmsh setlocal makeprg=gmsh\ %
    au FileType gmsh execute 'setlocal dict+=~/.vim/words/gmsh.txt'
    au FileType gnuplot setlocal makeprg=gnuplot\ %
    au FileType gnuplot setlocal commentstring=#%s
    au FileType freefem comp freefem
    au FileType dirvish setlocal relativenumber
    au BufWritePre *
        \ if !isdirectory(expand('<afile>:p:h')) |
          \ call mkdir(expand('<afile>:p:h'), 'p') |
        \ endif
augroup END
