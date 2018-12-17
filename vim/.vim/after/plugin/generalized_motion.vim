"" More general ; {{{1
let g:generalized_motion = "f"
function! Generalized_motion(...)
    if a:0 > 0
        let g:generalized_motion=a:1
        echom "Generalized motion:" g:generalized_motion
        if (g:generalized_motion == "f") | call feedkeys('f', 'n') | return | endif
        if (g:generalized_motion == "t") | call feedkeys('t', 'n') | return | endif
    endif
    if (g:generalized_motion == "f") | call feedkeys(';', 'n') | endif
    if (g:generalized_motion == "t") | call feedkeys(';', 'n') | endif
    try
        if (g:generalized_motion == "]q") | cnext | endif
        if (g:generalized_motion == "[q") | cprevious | endif
        if (g:generalized_motion == "]a") | next | endif
        if (g:generalized_motion == "[a") | previous | endif
        if (g:generalized_motion == "]b") | bnext | endif
        if (g:generalized_motion == "[b") | bprevious | endif
    catch
        call feedkeys(';', 'n')
    endtry
endfunction
for mapping in ['f', 't', ']q', '[q', ']a', '[a', ']f', '[f', ']b', '[b']
    exe "nmap <silent>" mapping ":<c-u>call Generalized_motion('".mapping."')<cr>"
endfor
nnoremap <silent> ; :<c-u>call Generalized_motion()<cr>
