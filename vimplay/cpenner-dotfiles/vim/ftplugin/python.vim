setlocal omnifunc=pythoncomplete#Complete
setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
setlocal textwidth=119
setlocal colorcolumn=120

nmap <localleader>d gd

autocmd! BufWritePost *.py call RunNeomake()
