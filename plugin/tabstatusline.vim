
if (exists("g:loaded_tabline_vim") && g:loaded_tabline_vim) || &cp
  finish
endif
let g:loaded_tabline_vim = 1

if !exists("g:sl_left_separator")  |let g:sl_left_separator      = '►'|endif
if !exists("g:sl_right_separator") |let g:sl_right_separator     = '◄' |endif
if !exists("g:sl_left_sep")        |let g:sl_left_sep            = '>' |endif
if !exists("g:sl_right_sep")       |let g:sl_right_sep           = '<' |endif

if !exists("g:sl_color_fg")            |let g:sl_color_fg            = '#000000' |endif
if !exists("g:sl_color_bg_info")       |let g:sl_color_bg_info       = '#778899' |endif
if !exists("g:sl_color_bg_normal")     |let g:sl_color_bg_normal     = '#b8bb26' |endif
if !exists("g:sl_color_bg_insert")     |let g:sl_color_bg_insert     = '#83a598' |endif
if !exists("g:sl_color_bg_visual")     |let g:sl_color_bg_visual     = '#FFA500' |endif
if !exists("g:sl_color_bg_replace")    |let g:sl_color_bg_replace    = 'tomato1' |endif
if !exists("g:sl_color_bg_statusline") |let g:sl_color_bg_statusline = '#3C444C' |endif

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab

    let s .= ' '
    let s .= (bufname != '' ?  fnamemodify(bufname, ':t')  : '         ')
    let s .= ' '

    if (tab == tabpagenr() || (tab + 1) == tabpagenr())
      let s .= '%#TabLineDivider'
      let s .= (tab == tabpagenr() ? 'Sel' : '')
      let s .= '#'.g:sl_left_separator
    elseif tab != tabpagenr('$')
      let s .= '%#TabLine#'.g:sl_left_sep
    endif

  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

set ls=2
let g:last_mode=''              "⭠

exec 'hi TabLine guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_statusline.' gui=none'
exec 'hi TabLineFill guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_statusline

let g:tl_fmt_color_normal    = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_normal
let g:tl_fmt_color_insert    = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_insert
let g:tl_fmt_color_visual    = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_visual
let g:tl_fmt_color_replace   = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_replace

let g:tl_arrow_color_normal   = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_normal.' gui=reverse'
let g:tl_arrow_color_insert   = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_insert.' gui=reverse'
let g:tl_arrow_color_visual   = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_visual.' gui=reverse'
let g:tl_arrow_color_replace  = 'guifg='.g:sl_color_bg_statusline.' guibg='.g:sl_color_bg_replace.' gui=reverse'

let g:sl_fmt_color_normal    = 'guifg='.g:sl_color_fg.' guibg='.g:sl_color_bg_normal
let g:sl_fmt_color_insert    = 'guifg='.g:sl_color_fg.' guibg='.g:sl_color_bg_insert
let g:sl_fmt_color_visual    = 'guifg='.g:sl_color_fg.' guibg='.g:sl_color_bg_visual
let g:sl_fmt_color_replace   = 'guifg='.g:sl_color_fg.' guibg='.g:sl_color_bg_replace

let g:sl_arrow_color_normal   = 'guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_normal.' gui=reverse'
let g:sl_arrow_color_insert   = 'guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_insert.' gui=reverse'
let g:sl_arrow_color_visual   = 'guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_visual.' gui=reverse'
let g:sl_arrow_color_replace  = 'guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_replace.' gui=reverse'

let g:sl_fmt_color_line       = 'guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_statusline
let g:sl_fmt_color_info       = 'guifg='.g:sl_color_fg.' guibg='. g:sl_color_bg_info
let g:sl_fmt_color_modified   = 'guifg='.g:sl_color_fg.' guibg='. g:sl_color_bg_info
let g:sl_fmt_color_info_arrow = 'guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_statusline

`let g:sl_fmt_color_statusline = 'gui=NONE guifg='.g:sl_color_bg_info.' guibg='.g:sl_color_bg_statusline

function! SetSLColorscheme()
  exec 'hi User1 '.g:sl_fmt_color_normal
  exec 'hi User2 '.g:sl_arrow_color_normal

  exec 'hi User5 '.g:sl_fmt_color_line
  exec 'hi User6 '.g:sl_fmt_color_info
  exec 'hi User7 '.g:sl_fmt_color_modified
  exec 'hi User8 '.g:sl_fmt_color_info_arrow

  exec 'hi StatusLine '.g:sl_fmt_color_statusline
  exec 'hi StatusLineNC '.g:sl_fmt_color_statusline

  exec 'hi TabLineSel '.g:sl_fmt_color_normal
  exec 'hi TabLineDivider  '.g:tl_fmt_color_normal
  exec 'hi TabLineDividerSel '.g:tl_arrow_color_normal
endfunction

function! Path()
  return expand("%:h")
endfunction

function! Mode()
  redraw
  let l:mode = mode()

  if mode ==# "n"
    exec 'hi User1 '.g:sl_fmt_color_normal
    exec 'hi User2 '.g:sl_arrow_color_normal
    exec 'hi TabLineSel '.g:sl_fmt_color_normal
    exec 'hi TabLineDivider  '.g:tl_fmt_color_normal
    exec 'hi TabLineDividerSel '.g:tl_arrow_color_normal
    return "NORMAL"
  elseif mode ==# "i"
    exec 'hi User1 '.g:sl_fmt_color_insert
    exec 'hi User2 '.g:sl_arrow_color_insert
    exec 'hi TabLineSel '.g:sl_fmt_color_insert
    exec 'hi TabLineDivider  '.g:tl_fmt_color_insert
    exec 'hi TabLineDividerSel '.g:tl_arrow_color_insert
    return "INSERT"
  elseif mode ==# "R"
    exec 'hi User1 '.g:sl_fmt_color_replace
    exec 'hi User2 '.g:sl_arrow_color_replace
    exec 'hi TabLineSel '.g:sl_fmt_color_replace
    exec 'hi TabLineDivider  '.g:tl_fmt_color_replace
    exec 'hi TabLineDividerSel '.g:tl_arrow_color_replace
    return "REPLACE"
  elseif mode ==# "v"
    exec 'hi User1 '.g:sl_fmt_color_visual
    exec 'hi User2 '.g:sl_arrow_color_visual
    exec 'hi TabLineSel '.g:sl_fmt_color_visual
    exec 'hi TabLineDivider  '.g:tl_fmt_color_visual
    exec 'hi TabLineDividerSel '.g:tl_arrow_color_visual
    return "VISUAL"
  elseif mode ==# "V"
    exec 'hi User1 '.g:sl_fmt_color_visual
    exec 'hi User2 '.g:sl_arrow_color_visual
    exec 'hi TabLineSel '.g:sl_fmt_color_visual
    exec 'hi TabLineDivider  '.g:tl_fmt_color_visual
    exec 'hi TabLineDividerSel '.g:tl_arrow_color_visual
    return "V-LINE"
  elseif mode ==# ""
    exec 'hi User1 '.g:sl_fmt_color_visual
    exec 'hi User2 '.g:sl_arrow_color_visual
    exec 'hi TabLineSel '.g:sl_fmt_color_visual
    exec 'hi TabLineDivider  '.g:tl_fmt_color_visual
    exec 'hi TabLineDividerSel '.g:tl_arrow_color_visual
    return "V-BLOCK"
  else
    return l:mode
  endif
endfunc

if has('statusline')
  call SetSLColorscheme()

  function! SetSLStyle()
    let &stl=""

    " mode (changes color)
    let &stl.="%1* %{Mode()} %0*"
    " separador
    let &stl.="%2*"
    let &stl.=g:sl_left_separator
    let &stl.="%0*"

    " filename
    let &stl.="%6* %<%t %0*"

    " read only, modified, modifiable flags in brackets
    let &stl.="%7*%{&modified ? '+':''}%0*"

    " readonly flag
    let &stl.="%7*%{(&ro!=0?'⭤':'')}%0*"

    let &stl.="%7* %0*"

    " separador
    let &stl.="%8*"
    let &stl.=g:sl_left_separator
    let &stl.="%0*"

    " relative paht
    let &stl.="%5* %<%{Path()} %0*"

    " right-aligh everything past this point
    let &stl.="%5*%= %0*"

    " separador
    let &stl.="%8*"
    let &stl.=g:sl_right_separator
    let &stl.="%0*"

    " file type (eg. python, ruby, etc..)
    let &stl.="%6*%( %{&filetype}%)%0*"

    " file format (eg. unix, dos, etc..)
    " let &stl.="%6*%{&fileformat} %0*"
    " separador
    let &stl.="%6* "
    let &stl.=g:sl_right_sep
    let &stl.=" %0*"

    " file encoding (eg. utf8, latin1, etc..)
    let &stl.="%6*%{(&fenc!=''?&fenc:&enc)} %0*"

    " separador
    let &stl.="%2*"
    let &stl.=g:sl_right_separator
    let &stl.="%0*"

    " percentage done
    let &stl.="%1* %p%%%0*"

    " separador
    let &stl.="%1* "
    let &stl.=g:sl_right_sep
    let &stl.=" %0*"

    "line number / total lines
    let &stl.="%1*⭡ %c:%l %0*"
  endfunc

  if !has('gui_running')
    au InsertEnter  * redraw!
    au InsertChange * redraw!
    au InsertLeave  * redraw!
  endif

  au ColorScheme * call SetSLColorscheme()
  au ColorScheme,VimEnter * call SetSLStyle()

  call SetSLStyle()

endif
