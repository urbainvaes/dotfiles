" function! VimFolds()
"     let thisline = getline(v:lnum)
"     if match(thisline,'^""  ') >= 0
"         return ">1"
"     elseif match(thisline,'^"  ') >=0
"         return ">1"
"     else
"         return "="
"     endif
" endfunction
"
" function! VimFoldText()
"     let startline = getline(v:foldstart)
"     if match(startline,'^""  ') >= 0
"         let title = substitute(startline,'^""  \(.*\)$','\1',"")
"         return '# ' . title
"     elseif match(startline,'^"  ') >=0
"         let title = substitute(startline,'^"  \(.*\)$','\1',"")
"         return '    ## ' .title
"     endif
" endfunction
"
" setlocal foldmethod=expr
" setlocal foldexpr=VimFolds()
" setlocal foldtext=VimFoldText()
