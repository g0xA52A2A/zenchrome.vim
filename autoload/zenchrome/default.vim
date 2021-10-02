function! zenchrome#default#ColorScheme() abort
  let [Foreground, LightForeground, Background, LightBackground] =
    \ &background ==# 'light'?
    \   ['Black',     'DarkGrey', 'White', 'LightGrey'] :
    \   ['LightGrey', 'White',    'Black', 'DarkGrey']

  return {
    \ 'Normal'       : { 'ctermfg' : Foreground, 'ctermbg' : Background },
    \ 'Visual'       : { 'ctermfg' : Background, 'ctermbg' : LightForeground },
    \
    \ 'CursorLine'   : { 'cterm' : 'underline' },
    \
    \ 'Constant'     : { 'ctermfg' : LightForeground },
    \
    \ 'Boolean'      : { 'links' : 'Constant' },
    \ 'Float'        : { 'links' : 'Constant' },
    \ 'Number'       : { 'links' : 'Constant' },
    \ 'PmenuSel'     : { 'links' : 'Constant' },
    \ 'QuickFixLine' : { 'links' : 'Constant' },
    \ 'StatusLine'   : { 'links' : 'Constant' },
    \ 'String'       : { 'links' : 'Constant' },
    \
    \ 'Error'        : { 'ctermfg' : 'Red' },
    \
    \ 'SpellBad'     : { 'links' : 'Error' },
    \ 'SpellCap'     : { 'links' : 'Error' },
    \ 'Todo'         : { 'links' : 'Error' },
    \ 'WarningMsg'   : { 'links' : 'Error' },
    \
    \ 'Search'       : { 'cterm' : 'underline' },
    \
    \ 'IncSearch'    : { 'links' : 'Search' },
    \ }
  }
endfunction
