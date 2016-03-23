function! FreeFemFolds()
    let thisline = getline(v:lnum)
    if match(thisline,'^/// ') >= 0
        return ">1"
    else
        return "="
    endif
endfunction

function! FreeFemFoldText()
    let startline = getline(v:foldstart)
    if match(startline,'^/// ') >= 0
        let title = substitute(startline,'^/// \(.*\)$','\1',"")
        return '# ' . title
    endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=FreeFemFolds()
setlocal foldtext=FreeFemFoldText()
