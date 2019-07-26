if exists('syntax_on')
  syntax reset
endif

let g:colors_name='zenchrome'

if &background ==# 'light'
  let s:Foreground       = 'Black'
  let s:LightForeground  = 'DarkGrey'
  let s:Background       = 'White'
  let s:LightBackground  = 'LightGrey'
elseif &background ==# 'dark'
  let s:Foreground       = 'LightGrey'
  let s:LightForeground  = 'White'
  let s:Background       = 'Black'
  let s:LightBackground  = 'DarkGrey'
endif

let s:Colorscheme = {
  \ 'Normal'     : { 'ctermfg': s:Foreground,      'ctermbg': s:Background,      'cterm': 'none'      },
  \
  \ 'Constant'   : { 'ctermfg': s:LightForeground, 'ctermbg': s:Background,      'cterm': 'none'      },
  \ 'Cursor'     : { 'ctermfg': s:Background,      'ctermbg': s:LightForeground, 'cterm': 'none'      },
  \ 'CursorLine' : { 'ctermfg': 'none',            'ctermbg': 'none',            'cterm': 'underline' },
  \ 'Error'      : { 'ctermfg': 'Red',             'ctermbg': s:Background,      'cterm': 'none'      },
  \ 'PmenuSel'   : { 'ctermfg': s:LightForeground, 'ctermbg': s:Background,      'cterm': 'none'      },
  \ 'Search'     : { 'ctermfg': 'none',            'ctermbg': 'none',            'cterm': 'underline' },
  \ 'StatusLine' : { 'ctermfg': s:LightForeground, 'ctermbg': s:Background,      'cterm': 'none'      },
  \ 'Visual'     : { 'ctermfg': s:Background,      'ctermbg': s:LightForeground, 'cterm': 'none'      },
  \
  \ 'Boolean'    : { 'links': 'Constant' },
  \ 'Float'      : { 'links': 'Constant' },
  \ 'Number'     : { 'links': 'Constant' },
  \ 'String'     : { 'links': 'Constant' },
  \
  \ 'SpellBad'   : { 'links': 'Error' },
  \ 'SpellCap'   : { 'links': 'Error' },
  \ 'Todo'       : { 'links': 'Error' },
  \ 'WarningMsg' : { 'links': 'Error' },
  \
  \ 'IncSearch'  : { 'links': 'Search' },
  \ }

" Clear all colors by passing an empty dictionary. Allows us to avoid setting
" attributes in our theme just to override Vim's defaults in highlight groups.
call zenchrome#ClearUndefinedColors({})

call zenchrome#SetColors(s:Colorscheme)

augroup zenchrome
  autocmd!
  autocmd Syntax * call zenchrome#ClearUndefinedColors(s:Colorscheme)
  autocmd Colorscheme zenchrome call zenchrome#ClearUndefinedColors(s:Colorscheme)
augroup END
