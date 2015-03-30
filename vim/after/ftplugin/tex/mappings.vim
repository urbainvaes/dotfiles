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

inoremap <buffer> `a \alpha
inoremap <buffer> `b \beta
inoremap <buffer> `g \gamma
inoremap <buffer> `d \delta
inoremap <buffer> `e \varepsilon
inoremap <buffer> `z \zeta
inoremap <buffer> `h \eta
inoremap <buffer> `t \theta
inoremap <buffer> `i \iota
inoremap <buffer> `k \kappa
inoremap <buffer> `l \lambda
inoremap <buffer> `m \mu
inoremap <buffer> `n \nu
inoremap <buffer> `x \xi
inoremap <buffer> `r \rho
inoremap <buffer> `s \sigma
inoremap <buffer> `f \phi
inoremap <buffer> `p \pi
inoremap <buffer> `w \omega

nnoremap <buffer> <LocalLeader>i :VimtexCompile<CR>
nnoremap <buffer> <LocalLeader>e :VimtexErrors<CR>
nnoremap <buffer> <LocalLeader>o :VimtexView<CR>
nnoremap <buffer> <LocalLeader>k :VimtexStop<CR>:VimtexClean<CR>
nnoremap <buffer> <LocalLeader>t :VimtexTocToggle<CR>
nnoremap <buffer> <LocalLeader>h :split header.sty<CR>
