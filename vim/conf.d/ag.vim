"ag search binding
" --- type ° to search the word in all files in the current dir
nnoremap <space>A :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>a :Ag! 
