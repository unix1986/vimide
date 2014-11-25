"Vim settings, rather than Vi settings
set nocompatible
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Ignore white spaces while using vimdiff
set diffopt+=iwhite
" Ignoring case in a pattern
set ignorecase
set smartcase
" :0  no indent for case and default
" g0  no indent for public, protected and private
" lN  If N != 0 Vim will align with a case label instead of the statement
"     after it in the same line.
" tN  Indent a function return type declaration N characters from the margin
" details :help cinoptions-values
set cino+=:0,g0,l1,t0
" Do not erase window
set t_ti= t_te=
" Show line number
set nu
" Auto align
set ai
" Tab width
set softtabstop=4
set sw=4
set expandtab
set tabstop=4

" Color scheme
colorscheme murphy
" Syntax highlight
syntax on
" Language for chinese, encoding and decoding
set fileencodings=ucs-dom,utf-8,gbk,latin1
" set foldmethod
set fdm=marker
" zf% match brackets fold
" zf10G current line to line number 10 fold
" 5zf current line down to 5 lines fold
" 5zf- current line up to 5 lines fold
" zc fold
" zC fold all
" zo open fold
" zO open all fold
" zE delete all fold
" zd delete current line fold

" TagList "C+]"--Go to Function Define 
"         "C+T"--Go to the origin position
let Tlist_Ctags_Cmd="$HOME/.vim/ctags/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" WinManager
let g:winManagerWindowLayout='BufExplorer|FileExplorer|TagList'
let g:winManagerOnRightSide=1
let g:winManagerWidth=35
let g:AutoOpenWinManager=0 " if auto open winmanager when start vim
nmap <F2> :WMToggle<CR>
nmap <F5> :BufExplorer<CR>
nmap <F4> :qa!<CR>
nmap <F10> :wqa!<CR>
