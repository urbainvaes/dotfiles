" Vim indent file

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetGeoIndent()
setlocal indentkeys&
setlocal autoindent
setlocal commentstring=//%s

if exists("*GetGeoIndent")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:skip_syntax = '\%(Comment\|String\)$'

function! GetGeoIndent()

  let lnum = prevnonblank(v:lnum - 1)

  if lnum == 0
    return 0
  endif

      let ind          = indent(lnum)
      let last_line    = getline(lnum)
      let current_line = getline(v:lnum)

      if last_line =~ '\(^\/\/\|^\/\*\)'
          return ind
      endif

      if last_line =~ '\(\<If\>\|\<For\>\|\<Macro\>\)'
          let ind += &shiftwidth
      endif

      if last_line =~ '\({[^}]*$\)'
          let ind += &shiftwidth
      endif

      if current_line =~ '\(^[^{]*}\)'
          let ind -= &shiftwidth
      endif

      if current_line =~ '\(\<EndIf\>\|\<EndFor\>\|\<Return\>\)$'
          let ind -= &shiftwidth
      endif

      return ind

endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
