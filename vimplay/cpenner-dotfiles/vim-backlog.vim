" Plug 'Yggdroot/indentLine'
" let g:indentLine_color_term = 239
    
" Test Runner
Plug 'janko-m/vim-test'
" vim-test{{{
    " let test#strategy = "dispatch" " dispatch, vimux, basic
    nmap <silent> <localleader>tt :TestNearest<CR>
    nmap <silent> <localleader>tf :TestFile<CR>
    " nmap <silent> <localleader>ta :TestSuite<CR>
    " nmap <silent> <localleader>ta :Nose -s system("git rev-parse --show-toplevel")<CR>

    nmap <silent> <localleader>tl :TestLast<CR>
    " nmap <silent> <localleader>tg :TestVisit<CR>

" Find test file in project
    function! OpenTestFile()
        let currentpath = expand('%:p:h')
        let newpath = substitute(currentpath, "src/app", "test", '')
        " Postfix _test
        " let newfilename = substitute(expand('%:t'), '\.', '_test\.', '')
        " Prefix test_
        let newfilename = 'test_' . expand('%:t')
        let newcompletepath = newpath . '/' . newfilename
        execute 'vsplit ' . newcompletepath
    endfunction
    nnoremap <localleader>te :call OpenTestFile()<cr>

" Run test file from project
    function! RunTestFile()
        let currentpath = expand('%:p:h')
        let newpath = substitute(currentpath, "src/app", "test", '')
        " Postfix _test
        " let newfilename = substitute(expand('%:t'), '\.', '_test\.', '')
        " Prefix test_
        let newfilename = 'test_' . expand('%:t')
        let newcompletepath = newpath . '/' . newfilename
        execute 'vsplit ' . newcompletepath
        execute 'TestFile ' . newcompletepath
        execute 'close'
    endfunction
    nnoremap <localleader>tr :call RunTestFile()<cr>
""}}}

    " Text objects
    Plug 'kana/vim-textobj-user'

"==============================
"         Autocomplete
"==============================
" Plugin 'vim-scripts/AutoComplPop'
" Plugin 'Shougo/neocomplcache.vim'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'ervandew/supertab'
" Plugin 'msanders/snipmate.vim'


"==============================
" These were slowing me down.
"==============================


" Python specific function/class bindings
Plugin 'bps/vim-textobj-python'

" Full python setup
Plugin 'klen/python-mode'

" Python-mode-----------------------{{{
" let g:pymode_rope = 1
" let g:pymode_rope_completion_bind = '<C-Space>'
" let g:pymode_rope_complete_on_dot = 1
" let g:pymode_rope_completion = 1
" let g:pymode_rope_autoimport_import_after_complete = 0

" let g:pymode_lint_ignore="E265,E116"
" }}}

" Adds Filetree
Plugin 'scrooloose/nerdtree'
" NerdTree mapping-------------------------{{{
nnoremap <leader>f :NERDTreeToggle<CR>B
let NERDTreeIgnore = ['\.pyc$']
" }}}

" List project overview as tags
Plugin 'majutsushi/tagbar'

    " Makes Hex colors show their color
    " Plugin 'sangwook/vim-coloresque'
-------------------------------------------------------------------------------
" ==============================
" Handy, but not using right now.
" ==============================
-------------------------------------------------------------------------------
git/sjl
" Redraw screen, (sjl)
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" List navigation
nnoremap <left>  :cprev<cr>zvzz
nnoremap <right> :cnext<cr>zvzz
nnoremap <up>    :lprev<cr>zvzz
nnoremap <down>  :lnext<cr>zvzz

" Python-Mode {{{
"
" let g:pymode_doc = 1
" let g:pymode_doc_key = 'M'
" let g:pydoc = 'pydoc'
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 0
" let g:pymode_syntax_builtin_objs = 1
" let g:pymode_syntax_print_as_function = 0
" let g:pymode_syntax_space_errors = 0
" let g:pymode_run = 0
" let g:pymode_lint = 0
" let g:pymode_breakpoint = 0
" let g:pymode_utils_whitespaces = 0
" let g:pymode_virtualenv = 0
" let g:pymode_folding = 0
"
" let g:pymode_options_indent = 0
" let g:pymode_options_fold = 0
" let g:pymode_options_other = 0
" let g:pymode_options = 0
"
" let g:pymode_rope = 1
" let g:pymode_rope_global_prefix = "<localleader>R"
" let g:pymode_rope_local_prefix = "<localleader>r"
" let g:pymode_rope_auto_project = 1
" let g:pymode_rope_enable_autoimport = 0
" let g:pymode_rope_autoimport_generate = 1
" let g:pymode_rope_autoimport_underlineds = 0
" let g:pymode_rope_codeassist_maxfixes = 10
" let g:pymode_rope_sorted_completions = 1
" let g:pymode_rope_extended_complete = 1
" let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
" let g:pymode_rope_confirm_saving = 1
" let g:pymode_rope_vim_completion = 1
" let g:pymode_rope_guess_project = 1
" let g:pymode_rope_goto_def_newwin = 0
" let g:pymode_rope_always_show_complete_menu = 0
"
" " }}}

" Allows deletion of buffers without reflowing windows or messing with splits
" Also allows 'unoding' a buffer kill.
" deletion of buffers  more stuff than that is really cool.
Plugin 'vim-scripts/bufkill.vim'

" Jumping to tags.
"
" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" split instead.
"
" Both of them will align the destination line to the upper middle part of the
" screen.  Both will pulse the cursor line so you can see where the hell you
" are.  <c-\> will also fold everything in the buffer and then unfold just
" enough for you to see the destination line.
function! JumpToTag()
    execute "normal! \<c-]>mzzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction
function! JumpToTagInSplit()
    execute "normal! \<c-w>v\<c-]>mzzMzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction
nnoremap <c-]> :silent! call JumpToTag()<cr>
nnoremap <c-\> :silent! call JumpToTagInSplit()<cr>

" Splash-screen
Plugin 'mhinz/vim-startify'
    " Startify -------------------------{{{
    let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

    " }}}


" Highlight Word
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction 

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}

function! s:Pulse() " {{{
    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()


nnoremap <leader>C :SyntasticCheck<cr>

" Zip Right (sjl)
"
" Moves the character under the cursor to the end of the line.  Handy when you
" have something like:
"
"     foo
"
" And you want to wrap it in a method call, so you type:
"
"     println()foo
"
" Once you hit escape your cursor is on the closing paren, so you can 'zip' it
" over to the right with this mapping.
"
" This should preserve your last yank/delete as well.
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>



" Adds case-smartness and easy substitution
Plugin 'tpope/vim-abolish.git'

" Improved substitution
Plugin 'osyo-manga/vim-over'

" Improves F and T by highlighting, can't use this and Sneak.
Plugin 'deris/vim-shot-f'

" Auto :set paste
Plugin 'ConradIrwin/vim-bracketed-paste'

" Switch
Plugin 'AndrewRadev/switch.vim'

" Highlight occurances of word under cursor.
Plugin 'osyo-manga/vim-brightest'

" Yank History
Plugin 'vim-scripts/YankRing.vim'
" YankRing-----------------------{{{
" let g:yankring_history_dir = '~/.vim/'
" let g:yankring_history_file = '.yankring_history'

" Yankring will use these, necessary to free up Y for mappings
" let g:yankring_n_keys = 'D'
" }}}

" Undo tree
Plugin 'sjl/gundo.vim'

" Tmux repl-style
Plugin 'jpalardy/vim-slime'

" Lisps ---------------------------------------{{{
" Clojure runtime
Plugin 'guns/vim-clojure-static'

" For Clojure REPL
Plugin 'tpope/vim-fireplace'

" Yay rainbows!
Plugin 'amdt/vim-niji'

" sexp commands
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'vim-scripts/paredit.vim'

" Slimv
" Plugin 'sjl/tslime.vim'
" Slimv-----------------------{{{
" let g:slimv_swank_cmd = "! osascript -e 'tell application \"Terminal\" to do script \"/sw/opt/sbcl-1.0.47/bin/sbcl --load ~/.vim/slime/start-swank.lisp\"'"
" let g:slimv_swank_cmd = '! sh -c \"sbcl --load /Applications/MacVim.app/Contents/Resources/vim/runtime/slime/start-swank.lisp\" &'
" let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
"
" }}}
" }}}

"==============================
"         Old Settings
"==============================

    " Quick file opening
    Plugin 'kien/ctrlp.vim'
    " CtrlP------------------------------------{{{
    let g:ctrlp_map = '<leader>p'

    " Go to tab if file is already open
    let g:ctrlp_switch_buffer = 't'

    nnoremap <Leader>o :CtrlP ~/
    let g:ctrlp_working_path_mode = 'r'
    " let g:ctrlp_use_caching = 1
    " let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
    " Always open in new buffer
    " let g:ctrlp_switch_buffer = 0

    " Use The Silver Searcher
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_user_command = 'ag %s -l -S --nocolor -g ""'
    " -S smartcase -m max matches
    " if executable('ag')
      " Use ag over grep
      " set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
    " endif

    " }}}

" Switch -------------------------{{{

nnoremap - :Switch<cr>

" autocmd FileType python let b:switch_custom_definitions =
"     \ [
"     \   {
"     \       'Initial with group \(\k\+\)': 'Change to this.',
"     \   },
"     \ ]
" }}}
-------------------------------------------------------------------------------
==============================
           Mappings
==============================

" Handy quickfix stuff
nnoremap <leader>] :cn<cr>
nnoremap <leader>[ :cN<cr>
nnoremap <leader>c :cclose<cr>

" set s to MY 'substitute' command,
" changes 'motion' to what's in the yank register without replacing it.
nnoremap <silent> <leader>s :set opfunc=MySubstitute<CR>g@
" Must be recursive, works linewise
nmap <silent> <leader>ss Vs
" visual mode option
vnoremap <silent> s :<C-U>call MySubstitute(visualmode(), 1)<CR>

function! MySubstitute(type, ...)
if a:0  " Invoked from Visual mode, use `< and `> marks.
    exe "normal! `<" . a:type . "`>\"_dP"
elseif a:type == 'line'
    silent exe "normal! '[V']\"_dP"
elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]\"_dP"
else
    silent exe "normal! `[v`]\"_dP"
endif
endfunction

" Easily copy and past to system clipboard
vnoremap ,y "+y
nnoremap ,y "+y
nnoremap ,p "+p
nnoremap ,P "+P
vnoremap ,p "+p
vnoremap ,P "+P

" Insert mode newline from wherever
inoremap <S-cr> <esc>o

" Get off my lawn
" nnoremap <Left> :echoe 'Use h'<CR>
" nnoremap <Right> :echoe 'Use l'<CR>
" nnoremap <Up> :echoe 'Use k'<CR>
" nnoremap <Down> :echoe 'Use j'<CR>

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Move block
" vnoremap J xp`[V`]
" vnoremap K xkP`[V`]

==============================
            Notes
==============================
LustyJuggler/Explorer:
C-t: open selected entry in new tab 
C-o: open selected entry in new hor-split
C-v: open selected entry in new vert-split
C-n: select the next entry 
C-p: select the previous entry 
C-w: move one directory upward at prompt 
C-u: clear the prompt 
    - New keys specific to the filesystem explorer: 
C-r: refresh directory contents 
C-a: open all files in the current list 
C-e: create a new file with the given name 

" These depend on text-obj-user
" Allows if / af objects
Plug 'thinca/vim-textobj-between'

" Indentation text objects
Plug 'kana/vim-textobj-indent'

" YankRing and 'replace from register' behaviour
Plug 'svermeulen/vim-easyclip'

"  diH and ciL for left and right sides of = statements
Plug 'vim-scripts/text-object-left-and-right'

" Mark and color everything in cool ways.
https://github.com/vim-scripts/Mark--Karkat


    " Search for all occurences of string in folder
    noremap g/ mz:Ag <cword> %<cr><C-w>w`z


    " Expand selections
    Plug 'terryma/vim-expand-region'
    " Expand-region-------------------------{{{
        vmap v <Plug>(expand_region_expand)
        vmap V <Plug>(expand_region_shrink)
    " }}}
    "
    "
    " Uses curl to interface with web api rest endpoints.
    Plug 'diepm/vim-rest-console'
    " Rest Console {{{
    augroup RESTConsole
        autocmd!
        autocmd BufRead __REST_response__ set filetype=rest
    augroup END

    "}}}



    " Adds session management sugar
    Plug 'vim-scripts/sessionman.vim'
    " SessionMan {{{
        nnoremap <leader>s :SessionList<cr>
        nnoremap <leader><leader>s :SessionSave<cr>
        nnoremap <leader>S :SessionOpenLast<cr>
    " }}}



    " Tables and alignment
    " Plug 'godlygeek/tabular'
    Plug 'dhruvasagar/vim-table-mode'
    " Table-mode {{{
        nnoremap cot :TableModeToggle<cr>
    " }}}
    Plug 'junegunn/vim-easy-align'
    " Easy-Align {{{
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <cr> <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
    " }}}
   
    
    " Quick Docs {{{
    function! ReadMan(man_section, winpos)
        " If 'man_section' is 0, use empty string instead.
        " We perform this check because v:count is 0 by default
        let s:old_iskeyword = &l:iskeyword
        setlocal iskeyword+=.
        let s:man_word = expand('<cword>')
        setlocal iskeyword-=.
        let s:man_section = a:man_section
        if(&l:keywordprg)
            let s:keyprg = &l:keywordprg
        else
            let s:keyprg = &keywordprg
        endif
        if s:man_section == 0
            let s:man_section = ''
        endif
        " Open a new window
        execute ":wincmd n"
        execute ":wincmd " . a:winpos
        " Make the new window a scratch buffer
        execute ":setlocal buftype=nofile"
        execute ":setlocal bufhidden=hide"
        execute ":setlocal noswapfile"
        " Don't list the buffer either
        execute ":setlocal nobuflisted"
        " Read in the man page for 'man_word' (col -b is for formatting)
        execute ":r! " . s:keyprg . " " . s:man_word . " | col -b"
        execute ":set ft=man"

        " Go to the first line and delete it
        execute ":goto"
        execute ":delete"
    endfunction
    set keywordprg=man

    " Map keys to the ReadMan() function
    nnoremap <silent> K :<C-U>call ReadMan(v:count,  'L')<cr>
    " }}}




    " Colors
    Plug 'tomasr/molokai'
    Plug 'guns/jellyx.vim'
    Plug 'morhetz/gruvbox'
    Plug 'freeo/vim-kalisi'
    Plug 'michalbachowski/vim-wombat256mod'
    " Highlight css colors
    Plug 'ap/vim-css-color'


    " Send text to buffer {{{
" function! GetTextObject(type)
"     let saved_register = @@
"     if a:type == 'v'
"         normal! `<v`>y
"     elseif a:type ==# 'char' || a:type ==# 'line'
"         normal! `[v`]y
"     endif
"     let text = @@
"     let @@ = saved_register
"     return text
" endfunction
 
" function! SendDirection(type, direction, back)
"     execute "normal! \<c-w>" . a:direction . "i" . GetTextObject(a:type) . "\<c-\>\<c-n>\<c-w>" . a:back
" endfunction
 
" function! SendRightOp(type)
"     call SendDirection(a:type, 'l', 'h')
" endfunction
" function! SendLeftOp(type)
"     call SendDirection(a:type, 'h', 'l')
" endfunction
" function! SendUpOp(type)
"     call SendDirection(a:type, 'k', 'j')
" endfunction
" function! SendDownOp(type)
"     call SendDirection(a:type, 'j', 'k')
" endfunction
 
" nnoremap <Leader>sl :set operatorfunc=SendRightOp<CR>g@
" vnoremap <Leader>sl :<C-U>call SendRightOp(visualmode())<CR>
" nnoremap <Leader>sh :set operatorfunc=SendLeftOp<CR>g@
" vnoremap <Leader>sh :<C-U>call SendLeftOp(visualmode())<CR>
" nnoremap <Leader>sk :set operatorfunc=SendUpOp<CR>g@
" vnoremap <Leader>sk :<C-U>call SendUpOp(visualmode())<CR>
" nnoremap <Leader>sj :set operatorfunc=SendDownOp<CR>g@
" vnoremap <Leader>sj :<C-U>call SendDownOp(visualmode())<CR>
"}}}
