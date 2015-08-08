inoremap <buffer> (( \left(
inoremap <buffer> )) \right)
inoremap <buffer> {{ \left\{
inoremap <buffer> }} \right\}
inoremap <buffer> [[ \left[
inoremap <buffer> ]] \right]
inoremap <buffer> == \,=\,
inoremap <buffer> >> \,\geq\,
inoremap <buffer> << \,\leq\,
inoremap <buffer> ++ \,+\,
inoremap <buffer> -- \,-\,

iabbrev <buffer> ga \alpha
iabbrev <buffer> gb \beta
iabbrev <buffer> gg \gamma
iabbrev <buffer> gd \delta
iabbrev <buffer> ge \varepsilon
iabbrev <buffer> gz \zeta
iabbrev <buffer> gh \eta
iabbrev <buffer> gt \theta
iabbrev <buffer> gi \iota
iabbrev <buffer> gk \kappa
iabbrev <buffer> gl \lambda
iabbrev <buffer> gm \mu
iabbrev <buffer> gn \nu
iabbrev <buffer> gx \xi
iabbrev <buffer> gr \rho
iabbrev <buffer> gs \sigma
iabbrev <buffer> gf \phi
iabbrev <buffer> gp \pi
iabbrev <buffer> gw \omega
iabbrev <buffer> dd \d

" function! SynctexShow()
"     let synctex = glob("*.synctex.gz")
"     if strlen(synctex) == 0
"         echom "no synctex file found"
"     else
"         let pdffile = substitute(synctex,"synctex.gz","pdf","")
"         let execline = printf(":!zathura --synctex-forward %d:%d:%s %s", line('.'), col('.'), shellescape(bufname("%")), shellescape(pdffile))
"         exec execline
"     end
" endfunction

" nnoremap <buffer> <LocalLeader>a :call SynctexShow()<CR><CR>
" nnoremap <buffer> <LocalLeader>i :Latexmk<CR>
" nnoremap <buffer> <LocalLeader>e :LatexErrors<CR>
" nnoremap <buffer> <LocalLeader>o :LatexView<CR>
" noremap  <buffer> <LocalLeader>k :LatexmkStop<CR>:LatexmkClean<CR>
" nnoremap <buffer> <LocalLeader>h :split header.sty<CR>


nnoremap <buffer> <LocalLeader>i :VimtexCompile<CR>
nnoremap <buffer> <LocalLeader>e :VimtexErrors<CR>
nnoremap <buffer> <LocalLeader>o :VimtexView<CR>
nnoremap <buffer> <LocalLeader>k :VimtexStop<CR>:VimtexClean<CR>
nnoremap <buffer> <LocalLeader>t :VimtexTocToggle<CR>
nnoremap <buffer> <LocalLeader>h :split header.sty<CR>
nnoremap <buffer> <LocalLeader>h :split header.sty<CR>
