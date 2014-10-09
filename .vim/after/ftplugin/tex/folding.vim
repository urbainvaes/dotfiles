function! TexFolds()
    let thisline = getline(v:lnum)
    if match(thisline,'^\\chapter') >= 0
        return ">1"
    elseif match(thisline,'^\\section') >= 0
        return ">1"
    elseif match(thisline,'^\\subsection') >=0 
        return ">1"
    elseif match(thisline,'^\\subsubsection') >=0
        return ">1"
    else
        return "="
    endif
endfunction

function! TexFoldText()
    let startline = getline(v:foldstart)
    let title = substitute(startline,'^.*{\(.*\)}.*$','\1',"")
    if match(startline,'^\\chapter') >= 0
        return '*' . title . ''
    elseif match(startline,'^\\section') >= 0
        return '    # ' . title
    elseif match(startline,'^\\subsection') >=0
        return '        ## ' . title
    elseif match(startline,'^\\subsubsection') >=0
        return '            ### ' . title
    else
        echom "Error, fold not recognized"
    endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=TexFolds()
setlocal foldtext=TexFoldText()
