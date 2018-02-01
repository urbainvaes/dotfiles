"" Download vim-plug if necessary {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
"" Leader and Localleader {{{
let mapleader = " "
let maplocalleader = ","
" }}}
"" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'LnL7/vim-nix'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'critiqjo/lldb.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'holomorph/vim-freefem'
Plug 'honza/vim-snippets'
Plug 'inkarkat/vim-SpellCheck'
Plug 'inkarkat/vim-ingo-library'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/heytmux'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'lervag/vimtex'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'sjl/Gundo.vim', { 'on' : 'GundoToggle' }
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'ton/vim-bufsurf'
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
Plug 'vim-scripts/gmsh.vim'
Plug 'wellle/targets.vim'

if has("nvim")
    " Plug 'roxma/nvim-completion-manager'
    Plug 'Shougo/deoplete.nvim'
    Plug 'zchee/deoplete-jedi'
    Plug 'hkupty/iron.nvim'
else
    Plug 'Shougo/neocomplete.vim'
endif

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'KKPMW/moonshine-vim'
Plug 'junegunn/seoul256.vim'
Plug 'romainl/Apprentice'
Plug 'josuegaleas/jay'
call plug#end()
" }}}
"" Plugin mappings {{{

" Toggles
nnoremap cpg :GitGutterToggle<cr>
nnoremap cpr :IronRepl<cr>
nnoremap cpn :NERDTreeToggle<cr>
nnoremap cpt :TagbarToggle<cr>
nnoremap cpu :GundoToggle<cr>

" Easy motion
map gs <Plug>(easymotion-prefix)

" Fuzzy finder
nnoremap <c-p>a  :Ag
nnoremap <c-p>b  :Buffers<cr>
nnoremap <c-p>c  :Commands<cr>
nnoremap <c-p>C  :Colors<cr>
nnoremap <c-p>f  :Files<cr>
nnoremap <c-p>g  :GitFiles<cr>
nnoremap <c-p>r  :History<cr>
nnoremap <c-p>:  :History:<cr>
nnoremap <c-p>/  :History/<cr>
nnoremap <c-p>l  :BLines<cr>
nnoremap <c-p>m  :Marks<cr>
nnoremap <c-p>t  :Tags<cr>

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

" Heytmux
function! Call_heytmux(vm)
    call feedkeys(":'[,']Heytmux!")
endfunction

nmap <silent> gh :set opfunc=Call_heytmux<cr>g@
xmap <silent> gh :Heytmux!<cr>

" Iron
let g:iron_map_defaults=0
let g:iron_repl_open_cmd='edit'
nmap yr <Plug>(iron-send-motion)
xmap R <Plug>(iron-send-motion)
nmap yrr VR

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
if &runtimepath =~ 'neomake'
    call neomake#configure#automake('w')
endif
" }}}
"" Plugin configurations {{{

" Airline
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'mixed-indent-file' ]
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" FZF.vim
let g:fzf_buffers_jump = 1

" Gundo
let g:gundo_prefer_python3 = 1

" Localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist='/home/*'

" NerdTree
let g:NERDTreeHijackNetrw = 0

" Ultisnips
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mySnippets']
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"
" let g:UltiSnipsUsePythonVersion=3

" Vimtex
let g:vimtex_fold_enabled=0
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=2
let g:vimtex_compiler_progname='nvr'

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

" }}}
"" Vim variables {{{
let g:netrw_bufsettings='relativenumber'
let g:tex_conceal= ''
let g:tex_flavor='latex'
" }}}
"" Vim options {{{
set backup
set swapfile
set undofile
set backupdir^=~/.vim/backup//
set directory^=~/.vim/swap//
set undodir^=~/.vim/undo//
" ^= : prepends to list
" // : store absolute path

set complete+=k
set conceallevel=2
set cursorline
set diffopt=filler,vertical
set expandtab
set exrc
set foldmethod=marker
set hidden
set ignorecase
set lazyredraw
set nojoinspaces
set nowrap
set path=$PWD/**
set shiftwidth=4
set showcmd
set splitright
set smartcase
set smartindent
set softtabstop=4
set t_Co=256
set tabstop=4
" set formatoptions+=orw
silent! set breakindent
let &showbreak='--> '
set clipboard=unnamedplus,unnamed
" set spellfile="$HOME/.vim/spell/en.utf-8.add"
if !has("nvim")
  set encoding=utf-8
endif
if has("nvim")
  set inccommand=split
endif
" }}}
"" Mappings {{{
nmap n nzz
nmap N Nzz

nnoremap <silent> <Plug>AddWhiteSpaceAfter a <Esc>h:silent call repeat#set("\<Plug>AddWhiteSpaceAfter")<cr>
nnoremap <silent> <Plug>AddWhiteSpaceBefore i <Esc>l:silent call repeat#set("\<Plug>AddWhiteSpaceBefore")<cr>

nmap ]w <Plug>AddWhiteSpaceAfter
nmap [w <Plug>AddWhiteSpaceBefore

nnoremap <Leader>w :update<cr>
nnoremap <Leader>q :q!<cr>
nnoremap <Leader>d :bd!<cr>

nnoremap <Leader>tn :tabnew<cr>
nnoremap <Leader>te :tabedit
nnoremap <Leader>tl :+tabmove<cr>
nnoremap <Leader>th :-tabmove<cr>
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
nnoremap <BS> <C-W>h

nnoremap <Leader>fw :%s/\s\+$//<cr>
nnoremap <Leader>ft :%s/^	\+//g<cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <up> <c-p>
cnoremap <down> <c-n>

nmap <silent> <b :BufSurfBack<cr>
nmap <silent> >b :BufSurfForward<cr>
nmap <silent> <B :BufSurfBack<cr>:bd! #<cr>
nmap <silent> >B :BufSurfForward<cr>:bd! #<cr>
nmap <silent> [B [b:bd! #<cr>
nmap <silent> ]B ]b:bd! #<cr>

if has("nvim")
    nnoremap goh :let @a=getcwd() \| lcd %:h \| terminal<cr>:execute 'lcd '.@a<cr>A
    tnoremap <c-x> <c-\><c-n><c-^>:bd! #<cr>
    nnoremap <c-_> :b # \| norm A<cr>
    tnoremap <c-_> <c-\><c-n><c-^>
endif
" }}}
"" Colorscheme {{{
let g:airline_theme='deus'
colo seoul256
" }}}
"" Autocommands {{{
augroup vimrc
    autocmd!
    au BufWritePost *vimrc,*exrc :source %
    au BufNewFile,Bufread /tmp/mutt-* setlocal tw=72
    au BufWritePre *
        \ if !isdirectory(expand('<afile>:p:h')) |
          \ call mkdir(expand('<afile>:p:h'), 'p') |
        \ endif

    " Detect filetypes (! 'setf freefem' does not override...)
    au BufNewFile,BufRead *.geo,*.msh set filetype=gmsh
    au BufNewFile,BufRead *.pde set filetype=freefem
    au BufNewFile,BufRead *.plt set filetype=gnuplot

    " Filetype specific
    au FileType gmsh setlocal makeprg=gmsh\ %
    au FileType gnuplot setlocal makeprg=gnuplot\ %
    au FileType gnuplot setlocal commentstring=#%s
    au FileType cpp setlocal commentstring=//%s
    au FileType freefem comp freefem
    au FileType dirvish setlocal relativenumber
    au FileType dirvish setlocal errorformat=%f
    au FileType tex set spell
augroup END

" }}}
"" My search {{{

" http://vim.wikia.com/wiki/Searching_for_files
" 1 argument: set search program and options
" 2 argument: do search
function! MySearch(...)
    let l:prevgrepprg=&grepprg
    let l:prevgrepformat=&grepformat
    if a:1 == "Rg"
        set grepprg=rg\ -uu\ --vimgrep
        set grepformat=%f:%l:%c:%m
    elseif a:1 == "Gnufind"
        set grepprg=find\ .\ -name
        set grepformat=%f
    elseif a:1 == "Gitfind"
        set grepprg=git\ ls-files\ -i\ -x
        set grepformat=%f
    endif
    execute 'silent grep!' a:2 | cwindow | redraw!
    let &grepprg=l:prevgrepprg
    let &grepformat=l:prevgrepformat
endfun

command! -nargs=+ -complete=file_in_path Rg      call MySearch("Rg", <q-args>)
command! -nargs=+ -complete=file_in_path Gnufind call MySearch("Gnufind", <q-args>)
command! -nargs=+ -complete=file_in_path Gitfind call MySearch("Gitfind", <q-args>)
command! -nargs=+ -complete=file_in_path GitGrep execute 'silent Ggrep!' <q-args> | cw | redraw!
command! -nargs=+ -complete=file_in_path VimGrep execute 'silent vimgrep!' <q-args> | cw | redraw!

" Default search and find programs
function! FillSearch(...)
    if a:0 == 0
        let l:filltext = ""
    else
        let l:is_visual=(a:1 == "v")
        let l:line=getline(l:is_visual ? "'<" : "'[")
        let [line1,col1] = getpos(l:is_visual ? "'<" : "'[")[1:2]
        let [line2,col2] = getpos(l:is_visual ? "'>" : "']")[1:2]
        let l:filltext =l:line[col1 - 1: col2 - 1]
    endif
    call feedkeys(':' . g:my_fillprg . ' "' . l:filltext . '"'."\<Left>")
endfunction

cmap <Plug>setSearchMode let g:my_fillprg=g:my_searchprgs[g:my_searchprg]<cr>
cmap <Plug>setFindMode   let g:my_fillprg=g:my_findprgs[g:my_findprg]<cr>
nmap <silent> g/  :<Plug>setSearchMode:set opfunc=FillSearch<cr>g@
nmap <silent> ,g  :<Plug>setSearchMode:call FillSearch()<cr>
xmap <silent> ,g  :<c-u><Plug>setSearchMode:call FillSearch(visualmode())<cr>
nmap <silent> ,f  :<Plug>setFindMode:call FillSearch()<cr>

let g:my_searchprgs = ['Rg', 'GitGrep', 'VimGrep']
let g:my_findprgs = ['Gnufind', 'Gitfind']
let g:my_searchprg = 0
let g:my_findprg = 0

" Cycle search / find prgs
nmap <silent> cog :let g:my_searchprg=(g:my_searchprg+1)%len(g:my_searchprgs)<cr>:echom g:my_searchprgs[g:my_searchprg]<cr>
nmap <silent> cof :let g:my_findprg=(g:my_findprg+1)%len(g:my_findprgs)<cr>:echom g:my_findprgs[g:my_findprg]<cr>

" }}}
