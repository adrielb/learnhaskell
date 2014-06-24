set autochdir


nnoremap <buffer> <leader>r :update \| SlimeSend1 :load baby.hs<CR>
nmap <cr> <Plug>SlimeLineSend
nnoremap <buffer> <leader>1 :silent ! gnome-terminal -e "tmux new ghci"&<CR>

let &makeprg = "ghc -o main.x % "
let &makeprg = "make %.x "
nnoremap <buffer> <leader>r :! main.x<CR>
