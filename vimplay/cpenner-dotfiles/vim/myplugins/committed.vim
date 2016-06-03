if !has('python')
    finish
endif

function! Committed()
    pyfile committed.py
endfunc

command! Committed call Committed()
