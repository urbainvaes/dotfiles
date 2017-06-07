if exists("current_compiler")
  finish
endif

let current_compiler = "gmsh"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

setlocal errorformat=[1m[31mError\ \ \ :\ \'%f\'\\,\ line\ %l\ :\ %m[0m
setlocal makeprg=gmsh\ %\ -\\|&\ grep\ Error
