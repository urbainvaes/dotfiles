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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'autozimu/LanguageClient-neovim'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'critiqjo/lldb.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'holomorph/vim-freefem'
Plug 'honza/vim-snippets'
Plug 'inkarkat/vim-SpellCheck'
Plug 'inkarkat/vim-ingo-library'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
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
Plug 'tommcdo/vim-ninja-feet'
Plug 'ton/vim-bufsurf'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'troydm/zoomwintab.vim'
let g:zoomwintab_hidetabbar=0
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/gmsh.vim'
Plug 'wellle/targets.vim'

Plug '~/Dropbox/projects/vim-remembrall'
Plug '~/Dropbox/projects/vim-wintab'

if has("nvim")
    " Plug 'roxma/nvim-completion-manager'
    Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
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
nnoremap <c-p>C  :Colors<cr>
nnoremap <c-p>f  :Files<cr>
nnoremap <c-p>g  :GitFiles<cr>
nnoremap <c-p>r  :History<cr>
nnoremap <c-p>:  :History:<cr>
nnoremap <c-p>/  :History/<cr>
nnoremap <c-p>l  :BLines<cr>
nnoremap <c-p>m  :Marks<cr>
nnoremap <c-p>t  :Tags<cr>
nnoremap <c-p>a  :Ag

nnoremap <a-b>  :Buffers<cr>
nnoremap <a-f>  :Files<cr>
nnoremap <a-g>  :GitFiles<cr>

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

nnoremap <silent> gh :set opfunc=Call_heytmux<cr>g@
xnoremap <silent> gh :Heytmux!<cr>

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

" Plug
nnoremap ,pi :PlugInstall<cr>
nnoremap ,pu :PlugUpdate<cr>

" Ultisnips
nnoremap cps :UltiSnipsEdit<cr>

" Neomake
nnoremap gm :Make<cr>
nnoremap gM :Neomake!<cr>
if &runtimepath =~ 'neomake'
    call neomake#configure#automake('w')
endif

let g:neomake_gcc_args=[
            \ '-Wall',
            \ '-Wextra',
            \ '-Wpedantic',
            \ '-I.', '-I..', '-I../..'
            \ ]
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

" Remembrall
nnoremap <silent> ,, :call remembrall#remind('n', '')<cr>
nnoremap <silent> y :<c-u>call remembrall#remind('n', 'y')<cr>
let g:remembrall_suffixes=['', '?']
let g:remembrall_window='botright 10new'

augroup remembrall
    autocmd FileType tex nnoremap <buffer> <nowait> <expr> ,l Remembrall('n', ',l')
augroup END

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
let g:vimtex_fold_enabled=1
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=2
let g:vimtex_compiler_progname='nvr'

let g:wintab_boundary='create'
let g:wintab_mode='wintab'

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
        execute 'NeoCompleteLock'
    endif
endfunction

function! Multiple_cursors_after()
    if has("nvim")
        let b:deoplete_disable_auto_complete = 0
    else
        execute 'NeoCompleteUnlock'
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
set mouse=a
set nojoinspaces
set nowrap
set path=$PWD/**
set shiftwidth=4
set showcmd
set splitright
set smartcase
set smartindent
set softtabstop=-1 " set sotftabstop=&shiftwidth
" set formatoptions+=orw
silent! set breakindent
let &showbreak='--> '
set clipboard^=unnamedplus,unnamed
" set spellfile="$HOME/.vim/spell/en.utf-8.add"
if !has("nvim")
  set encoding=utf-8
endif
if has("nvim")
  set inccommand=split
endif
" }}}
"" Mappings {{{
nnoremap n nzz
nnoremap N Nzz

nnoremap <silent> <Plug>AddWhiteSpaceAfter a <Esc>h:silent call repeat#set("\<Plug>AddWhiteSpaceAfter")<cr>
nnoremap <silent> <Plug>AddWhiteSpaceBefore i <Esc>l:silent call repeat#set("\<Plug>AddWhiteSpaceBefore")<cr>

nmap ]w <Plug>AddWhiteSpaceAfter
nmap [w <Plug>AddWhiteSpaceBefore

nnoremap <Leader>w :update<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>d :bd!<cr>
nnoremap <nowait> <c-d> :q<cr>

nnoremap ,bd :ls<cr>:bd<space>

nnoremap ,tn :tabnew<cr>
nnoremap ,te :tabedit
nnoremap ,tl :+tabmove<cr>
nnoremap ,th :-tabmove<cr>
nnoremap ,tm :tabmove
nnoremap ,t0 :tabmove 0<cr>
nnoremap ,t$ :tabmove<cr>

nnoremap <Leader>c :!rm ~/.vim/swap/\%*<cr>
nnoremap <Leader>r :Start %:p<cr>
nnoremap <Leader>R :Start! %:p<cr>

nnoremap cqo :copen<cr>
nnoremap cqc :cclose<cr>

nnoremap got :call system('urxvt -cd '.getcwd().' &')<cr>
nnoremap goT :call system('urxvt -cd '.expand("%:p:h").' &')<cr>
nnoremap gof :call system('urxvt -e vifm '.getcwd().' '.getcwd().' &')<cr>
nnoremap goF :call system('urxvt -e vifm '.expand("%:p:h").' '.expand("%:p:h").' &')<cr>

nnoremap <LocalLeader>h :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<cr>
nnoremap Y y$

nnoremap <Leader>fw :%s/\s\+$//<cr>
nnoremap <Leader>ft :%s/^	\+//g<cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <up> <c-p>
cnoremap <down> <c-n>

" Overwrite unimpaired mappings
nnoremap <silent> <b :BufSurfBack<cr>
nnoremap <silent> >b :BufSurfForward<cr>
nnoremap <silent> <B :BufSurfBack<cr>:bd! #<cr>
nnoremap <silent> >B :BufSurfForward<cr>:bd! #<cr>

" Alternate file
nnoremap <bs> 
nnoremap <tab> 

" Source current file
nnoremap ,s :source %<cr>

" Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" Spell
inoremap <c-s> <esc>1z=eA

nmap co =o

" }}}
"" Colorscheme {{{
function! SaveColo(...)
    if &runtimepath =~ 'airline'
        execute 'set background='.a:1
        execute 'AirlineTheme' a:3
        execute 'colorscheme' a:2
    endif
    execute 'silent !echo "set background='.a:1.'" > ~/.local/colors.vim'
    execute 'silent !echo "colorscheme '.a:2.'" >> ~/.local/colors.vim'
    execute 'silent !echo "let g:airline_theme=\"'.a:3.'\"" >> ~/.local/colors.vim'
endfunction
function! MyColo(colorscheme)
    if a:colorscheme == "solarized-light"
        call SaveColo("light","solarized","solarized")
    elseif a:colorscheme == "solarized-dark"
        call SaveColo("dark","solarized","solarized")
    elseif a:colorscheme == "seoul"
        call SaveColo("dark","seoul256","deus")
    elseif a:colorscheme == "nord"
        call SaveColo("dark","nord","nord")
    endif
endfunction
if filereadable($HOME."/.local/colors.vim")
    source ~/.local/colors.vim
endif
nnoremap ,c :call MyColo("")<Left><Left>
nnoremap ,cl :call MyColo("solarized-light")<cr>
nnoremap ,cd :call MyColo("solarized-dark")<cr>
nnoremap ,cs :call MyColo("seoul")<cr>
nnoremap ,cn :call MyColo("nord")<cr>
" }}}
"" Autocommands {{{
augroup vimrc
    autocmd!
    autocmd BufWritePost *vimrc,*exrc :call feedkeys(":source %\<cr>")
    autocmd BufNewFile,Bufread /tmp/mutt-* setlocal tw=72
    autocmd BufWritePre *
        \ if !isdirectory(expand('<afile>:p:h')) |
          \ call mkdir(expand('<afile>:p:h'), 'p') |
        \ endif

    " Detect filetypes (! 'setf freefem' does not override...)
    autocmd BufNewFile,BufRead *.geo,*.msh set filetype=gmsh
    autocmd BufNewFile,BufRead *.pde set filetype=freefem
    autocmd BufNewFile,BufRead *.plt set filetype=gnuplot

    " Filetype specific
    autocmd FileType cmake setlocal commentstring=#%s
    autocmd FileType cpp setlocal commentstring=//%s
    autocmd FileType freefem comp freefem
    autocmd FileType gmsh setlocal makeprg=gmsh\ %
    autocmd FileType gnuplot setlocal commentstring=#%s
    autocmd FileType gnuplot setlocal makeprg=gnuplot\ %
    autocmd FileType python setlocal makeprg=python\ %
    autocmd FileType tex setlocal spell

    " Dirvish
    autocmd FileType dirvish nnoremap <buffer> t :!touch %
    autocmd FileType dirvish setlocal errorformat=%f
    autocmd FileType dirvish setlocal relativenumber
    autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

" }}}
"" My search {{{

" http://vim.wikia.com/wiki/Searching_for_files
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

let g:my_searchprgs = ['Rg', 'GitGrep', 'VimGrep']
let g:my_findprgs = ['Gnufind', 'Gitfind']
let g:my_searchprg = 0
let g:my_findprg = 0

nnoremap <silent> g/  :let g:my_fillprg=g:my_searchprgs[g:my_searchprg]<cr>:set opfunc=FillSearch<cr>g@
nnoremap <silent> ,g  :let g:my_fillprg=g:my_searchprgs[g:my_searchprg]<cr>:call FillSearch()<cr>
xnoremap <silent> ,g  :<c-u>let g:my_fillprg=g:my_searchprgs[g:my_searchprg]<cr>:call FillSearch(visualmode())<cr>
nnoremap <silent> ,f  :let g:my_fillprg=g:my_findprgs[g:my_findprg]<cr>:call FillSearch()<cr>

" Cycle search / find prgs
nnoremap <silent> cog :let g:my_searchprg=(g:my_searchprg+1)%len(g:my_searchprgs)<cr>:echom g:my_searchprgs[g:my_searchprg]<cr>
nnoremap <silent> cof :let g:my_findprg=(g:my_findprg+1)%len(g:my_findprgs)<cr>:echom g:my_findprgs[g:my_findprg]<cr>

" }}}
"" Neovim {{{
if has("nvim")
    nnoremap goh :let @a=getcwd() \| lcd %:h \| terminal<cr>:execute 'lcd '.@a<cr>A
    tnoremap <c-x> <c-\><c-n><c-^>:bd! #<cr>
    nnoremap <c-_> :b # \| norm A<cr>
    tnoremap <c-_> <c-\><c-n><c-^>
    nnoremap <Leader>t :b term \| norm A<cr>

    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
    inoremap <A-h> <C-\><C-N><C-w>h
    inoremap <A-j> <C-\><C-N><C-w>j
    inoremap <A-k> <C-\><C-N><C-w>k
    inoremap <A-l> <C-\><C-N><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
endif
" }}}
