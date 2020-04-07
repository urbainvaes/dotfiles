for i in range(1, 255)
    exe "highlight vimHiNmbrFg".i." ctermfg=".i
    exe "highlight vimHiNmbrBg".i." ctermfg=black ctermbg=".i
endfor
