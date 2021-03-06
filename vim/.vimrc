"" Download vim-plug if necessary {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Leader and Localleader {{{1
let mapleader = " "
let maplocalleader = ","

"" Plugins {{{1
call plug#begin('~/.vim/plugged')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
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
Plug 'mg979/vim-visual-multi'
Plug 'neomake/neomake'
Plug 'sjl/Gundo.vim', { 'on' : 'GundoToggle' }
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-ninja-feet'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'troydm/zoomwintab.vim'
let g:zoomwintab_hidetabbar=0
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/gmsh.vim'
Plug 'wellle/targets.vim'

if isdirectory($HOME."/dotfiles/plugins")
    " Plug '~/dotfiles/plugins/vim-remembrall'
    Plug '~/dotfiles/plugins/vim-tmux-pilot'
    Plug '~/dotfiles/plugins/vim-ripple'
    Plug '~/dotfiles/plugins/vim-darjeeling'
    Plug '~/dotfiles/plugins/vim-macaw'
endif

if has("nvim")
    Plug '~/dotfiles/plugins/nvim-i3scratchpad'
endif

if has("nvim") && hostname() != "peuplier"
    " Plug 'neovim/nvim-lsp'
endif

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'KKPMW/sacredforest-vim'
Plug 'junegunn/seoul256.vim'
Plug 'romainl/Apprentice'
Plug 'arcticicestudio/nord-vim'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'axvr/zepl.vim'
call plug#end()

"" Plugin configuration {{{1

" Toggles
nnoremap cpg :GitGutterToggle<cr>
nnoremap cpn :NERDTreeToggle<cr>
nnoremap cpt :TagbarToggle<cr>
nnoremap cpu :GundoToggle<cr>
nnoremap <expr> cp Remembrall('cp')

" Fuzzy finder
nnoremap <c-p>a :Ag
nnoremap <c-p>b :Buffers<cr>
nnoremap <c-p>C :Colors<cr>
nnoremap <c-p>f :Files<cr>
nnoremap <c-p>g :GitFiles<cr>
nnoremap <c-p>r :History<cr>
nnoremap <c-p>: :History:<cr>
nnoremap <c-p>/ :History/<cr>
nnoremap <c-p>l :BLines<cr>

nnoremap <a-b> :Buffers<cr>
nnoremap <a-f> :Files<cr>
nnoremap <a-g> :GitFiles<cr>

" Fugitive
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gd :Gdiff<cr>

" Multiple cursors
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = "<M-j>"
let g:VM_maps["Select Cursor Up"] = "<M-k>"

" Heytmux
function! Call_heytmux(vm)
    call feedkeys(":'[,']Heytmux!")
endfunction

nnoremap <silent> gh :set opfunc=Call_heytmux<cr>g@
xnoremap <silent> gh :Heytmux!<cr>

" Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap gl <Plug>(LiveEasyAlign)
nmap gl <Plug>(LiveEasyAlign)

" Plug
nnoremap ,pi :PlugInstall<cr>
nnoremap ,pu :PlugUpdate<cr>
nnoremap ,pc :PlugClean<cr>

" Remembrall
if &runtimepath =~ 'remembrall'
    let g:remembrall_auto_accept = 0
    nnoremap <buffer> <nowait> <expr> ,p Remembrall(',p')
    nnoremap <silent> <expr> ,, Remembrall('')
    augroup remembrall
        autocmd FileType tex nnoremap <buffer> <silent> <expr> ,l Remembrall(',l')
    augroup END
endif
let g:remembrall_suffixes = [""]
let g:ripple_winpos = "vertical"
let g:ripple_term_name = "term: ripple"

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

let g:neomake_python_enabled_makers = ['python', 'pylint']

" FZF.vim
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Gundo
let g:gundo_prefer_python3 = 1

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
let g:vimtex_fold_enabled=1  " Makes %s slow!
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=2
let g:vimtex_compiler_progname='nvr'
let g:vimtex_syntax_enabled=1
let g:vimtex_toc_config={
            \ 'layer_status': {
                \ 'content': 1,
                \ 'label': 0,
                \ 'todo': 1,
                \ 'include': 1 },
            \ 'show_help': 0}

let g:vimtex_delim_toggle_mod_list = [
  \ ['\left', '\right'],
  \ ['\bigl', '\bigr'],
  \ ['\Bigl', '\Bigr'],
  \ ['\biggl', '\biggr'],
  \ ['\Biggl', '\Biggr'],
  \]

" Pilot
let g:pilot_boundary='ignore'
let g:pilot_mode='wintab'
" let g:pilot_split_or_new='new'
" let g:pilot_key_h='<a-h>'
" let g:pilot_key_j='<a-j>'
" let g:pilot_key_k='<a-k>'
" let g:pilot_key_l='<a-l>'
" let g:pilot_key_p='<a-\>'

"" Vim variables {{{1
let g:netrw_bufsettings='relativenumber'
let g:tex_conceal= ''
let g:tex_flavor='latex'

"" Vim options {{{1
set backup
set undofile
set backupdir^=~/.vim/backup//
set directory^=~/.vim/swap//
set undodir^=~/.vim/undo//
" ^= : prepends to list
" // : store absolute path

" set complete+=k
set conceallevel=0
set cursorline
set diffopt=filler,vertical,hiddenoff
set expandtab
set exrc
set foldmethod=marker
set hidden
set ignorecase
set lazyredraw
set laststatus=2
set listchars+=eol:$
set wildcharm=<C-z>
set mouse=a
" set noequalalways
set nojoinspaces
set nowrap
set path+=$PWD/**
set shiftwidth=4
set showcmd
set splitright
set smartcase
set nosmartindent
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

"" Mappings {{{1

" .rst headings
nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``

nnoremap <leader>m :.m

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

nnoremap ,te :tabedit<space>
nnoremap ,tl :+tabmove<cr>
nnoremap ,th :-tabmove<cr>
nnoremap ,t0 :tabmove 0<cr>
nnoremap ,t$ :tabmove<cr>

nnoremap <Leader>c :call delete($HOME."/.vim/swap/".substitute(expand('%:p'), '/', '%', 'g').".swp")<cr>
nnoremap <Leader>r :Start %:p<cr>
nnoremap <Leader>R :Start! %:p<cr>

nnoremap cqo :copen<cr>
nnoremap cqh :colder<cr>
nnoremap cqc :cclose<cr>

nnoremap got :call system('urxvt -cd '.getcwd().' &')<cr>
nnoremap goT :call system('urxvt -cd '.expand("%:p:h").' &')<cr>
nnoremap gof :call system('urxvt -e vifm '.getcwd().' '.getcwd().' &')<cr>
nnoremap goF :call system('urxvt -e vifm '.expand("%:p:h").' '.expand("%:p:h").' &')<cr>

nnoremap \h :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<cr>
nnoremap Y y$

nnoremap <Leader>fw :%s/\s\+$//<cr>
nnoremap <Leader>ft :%s/^	\+//g<cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <up> <c-p>
cnoremap <down> <c-n>

" Alternate file
nnoremap <bs> 
nnoremap + :Buffers<cr>

" Align
nnoremap <F2> vip:EasyAlign * <bar><cr>:w<cr>

" Source current file
nnoremap ,s :source %<cr>

" Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" Spell
inoremap <nowait> <c-g> <esc>h1z=ea
nnoremap <Leader>s 1z=

" Projectionist
nnoremap ,e :E

" Unimpaired
nmap co yo

"" Autocommands {{{1
augroup vimrc
    autocmd!
    " autocmd ColorScheme * highlight String ctermfg=192 guifg=#d7ff87
    " autocmd ColorScheme * highlight Folded ctermbg=23 ctermfg=185 guibg=#005f5f guifg=#d7d75f
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
    autocmd FileType julia setlocal makeprg=julia\ %
    autocmd FileType tex setlocal spell spelllang=en_us

    " Dirvish
    autocmd FileType dirvish nnoremap <buffer> t :!touch %
    autocmd FileType dirvish setlocal errorformat=%f
    autocmd FileType dirvish setlocal relativenumber
    autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

"" Colorscheme {{{1
nnoremap ,cd  :colorscheme darjeeling<cr>
nnoremap ,cs :colorscheme seoul256<cr>
set notermguicolors
colo darjeeling

"" My search {{{1

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
nnoremap <silent> cog :let g:my_searchprg=(g:my_searchprg+1)%len(g:my_searchprgs)<cr>:let &ro = &ro<cr>
nnoremap <silent> cof :let g:my_findprg=(g:my_findprg+1)%len(g:my_findprgs)<cr>:let &ro = &ro<cr>

"" Status line {{{1
function! Mixed_indent()
    let l:spaces=search('\v(^ +)','n')
    let l:tabs=search('\v(^\t+)','n')
    return (l:spaces * l:tabs > 0)
endfunction

function! GlobalCwd()
    return getcwd(-1, -1)
endfunction

function! TabCwd(number)
    if haslocaldir(-1, a:number)
        return getcwd(-1, a:number)
    endif
    return ""
endfunction

function! WinCwd()
    if haslocaldir(0)
        return getcwd()
    endif
    return ""
endfunction

set showtabline=2
let g:tabprefix = ""
let g:tablabel = "%N%{flagship#tabmodified()} %{TabCwd(v:lnum) != '' ? pathshorten(TabCwd(v:lnum)) : ''}"
let g:flagship_skip = 'FugitiveStatusline'

augroup myflags
    autocmd!
    autocmd CmdwinEnter,BufEnter,BufRead,BufWritePost * let b:trailing=search('\s\+$','n')
    autocmd CmdwinEnter,BufEnter,BufRead,BufWritePost * let b:mixed=Mixed_indent()
    autocmd User Flags call Hoist("buffer", "%{FugitiveHead('') != '' ? '['.FugitiveHead('').']' : ''}")
    autocmd User Flags call Hoist("buffer", "%{b:trailing?'[tw]':''}")
    autocmd User Flags call Hoist("buffer", "%{b:mixed?'[mixed]':''}")
    autocmd User Flags call Hoist("buffer", "%{&paste?'[paste]':''}")
    autocmd User Flags call Hoist("window", "%{WinCwd() != '' ? '['.WinCwd().']' : ''}")

    highlight MyGlobals ctermfg=255 ctermbg=240
    autocmd User Flags call Hoist("global", {"hl": "MyGlobals"}, "[%{pathshorten(GlobalCwd())}, %{g:my_searchprgs[g:my_searchprg]}, %{g:my_findprgs[g:my_findprg]}]")
augroup END

"" Neovim {{{1
if has("nvim")
    nnoremap goh :let @a=getcwd() \| lcd %:h \| terminal<cr>:execute 'lcd '.@a<cr>A
    tnoremap <c-x> <c-\><c-n><c-^>:bd! #<cr>
    nnoremap <c-_> :b # \| norm A<cr>
    tnoremap <c-_> <c-\><c-n><c-^>
    nnoremap <Leader>t :b term \| norm A<cr>
endif

"" Experimental {{{1
" if has("nvim") && hostname() != "peuplier"
"     lua require'nvim_lsp'.pyls.setup{}
"     autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
"     nnoremap <expr> <c-g> Remembrall('<c-g>')
"     nnoremap <silent> <c-g>h <cmd>lua vim.lsp.buf.hover()<cr>
"     nnoremap <silent> <c-g>a <cmd>lua vim.lsp.buf.declaration()<cr>
"     nnoremap <silent> <c-g>d <cmd>lua vim.lsp.buf.definition()<cr>
"     nnoremap <silent> <c-g>i <cmd>lua vim.lsp.buf.implementation()<cr>
"     nnoremap <silent> <c-g>s <cmd>lua vim.lsp.buf.signature_help()<cr>
"     nnoremap <silent> <c-g>t <cmd>lua vim.lsp.buf.type_definition()<cr>
"     nnoremap <silent> <c-g><c-g> <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>
" endif
