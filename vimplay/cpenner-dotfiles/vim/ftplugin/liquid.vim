" Render pdf from markdown
nnoremap <buffer> <leader>p :NeomakeSh pandoc % -o %:r.pdf --latex-engine=xelatex --highlight-style=tango -s --filter pandoc-citeproc<cr>
