setlocal noexpandtab
setlocal nolist

autocmd! BufWritePost *.go call RunNeomake()
autocmd! BufEnter Preview,Quickfix,[Scratch] setlocal nobuflisted
autocmd! BufEnter * if &l:buftype ==# 'nofile' || &l:buftype ==# 'quickfix' | setlocal nobuflisted | endif

nnoremap ++ :GoFmt<cr>

nmap <localleader>r <Plug>(go-run-split)
nmap <localleader>b <Plug>(go-build)
nmap <localleader>t <Plug>(go-test)
nmap <localleader>c <Plug>(go-coverage)
nmap <localleader>d gd
nmap gb <Plug>(go-doc-browser)

nnoremap <leader>et :vsp %:r_test.go<cr>
