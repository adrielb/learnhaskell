set makeprg=./redo\ redo

function! BuildRedo()
	set makeprg=./build.sh
	exec ":make"
	set makeprg=./redo\ redo
endfunction

noremap <leader>b :call BuildRedo()<CR>
