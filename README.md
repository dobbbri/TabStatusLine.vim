TabStatusLine.vim
=================

TabLine and StatusLine with simple configurations.

Put in .vimrc:

set encoding=utf-8              " Necessary to show Unicode glyphs

set guioptions=                 " Remove all, toolbar, menu etc..

set showtabline=2               " Always show the tabline

set laststatus=2                " Always show the statusline



Bundle 'https://github.com/sldobri/TabStatusLine.vim'



let g:sl_left_separator      = '►'   "'⮀'

let g:sl_right_separator     = '◄'   "'⮂'

let g:sl_left_sep            = '|'   "'⮁'

let g:sl_right_sep           = '|'   "'⮃'



let g:sl_color_fg            = 'black'

let g:sl_color_bg_info       = '#778899'

let g:sl_color_bg_normal     = '#b8bb26'

let g:sl_color_bg_insert     = '#83a598'

let g:sl_color_bg_visual     = '#FFA500'

let g:sl_color_bg_replace    = 'tomato1'

let g:sl_color_bg_statusline = '#3C444C'



