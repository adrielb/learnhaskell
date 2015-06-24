let s:efm = "%f:%l:%c:,"
let s:efm .="%f:%l:%c:%m,"
let s:efm .="%m %f:%l:%c,"
let s:efm .="%m %f:%l:%c),"
let s:efm .="%+G"
let &efm=s:efm
