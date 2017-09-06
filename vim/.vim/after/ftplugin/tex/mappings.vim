iabbrev <buffer> (( \left(
iabbrev <buffer> )) \right)
iabbrev <buffer> {{ \left\{
iabbrev <buffer> }} \right\}
iabbrev <buffer> [[ \left[
iabbrev <buffer> ]] \right]
iabbrev <buffer> == \,=\,
iabbrev <buffer> >> \,\geq\,
iabbrev <buffer> << \,\leq\,
iabbrev <buffer> ++ \,+\,
iabbrev <buffer> -- \,-\,

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

iabbrev <buffer> gB \Beta
iabbrev <buffer> gG \Gamma
iabbrev <buffer> gD \Delta
iabbrev <buffer> gT \Theta
iabbrev <buffer> gL \Lambda
iabbrev <buffer> gX \Xi
iabbrev <buffer> gP \Pi
iabbrev <buffer> gS \Sigma
iabbrev <buffer> gW \Omega
iabbrev <buffer> gF \Phi

nnoremap <buffer> <LocalLeader>i :VimtexCompile<CR>
nnoremap <buffer> <LocalLeader>e :VimtexErrors<CR>
nnoremap <buffer> <LocalLeader>o :VimtexView<CR>
nnoremap <buffer> <LocalLeader>k :VimtexStop<CR>:VimtexClean<CR>
nnoremap <buffer> <LocalLeader>t :VimtexTocToggle<CR>
nnoremap <buffer> <LocalLeader>h :split header.sty<CR>
nnoremap <buffer> <LocalLeader>d :!latexdiff-git main_old.tex main.tex > diff.tex<CR>
