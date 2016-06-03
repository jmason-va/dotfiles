nnoremap <buffer> <localleader>p :Pandoc pdf<cr>
nnoremap <buffer> <localleader>l :Xmark<cr>
setlocal nolist
setlocal formatprg=pandoc\ -t\ markdown\ --columns\ 79
