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

let g:Colorscheme = {
  \ 'Normal'     : { 'ctermfg': s:Foreground,      'ctermbg': s:Background,      'cterm': 'none'      },
  \
  \ 'Constant'   : { 'ctermfg': s:LightForeground, 'ctermbg': 'none',            'cterm': 'none'      },
  \ 'Cursor'     : { 'ctermfg': s:Background,      'ctermbg': s:LightForeground, 'cterm': 'none'      },
  \ 'CursorLine' : { 'ctermfg': 'none',            'ctermbg': 'none',            'cterm': 'underline' },
  \ 'Error'      : { 'ctermfg': 'Red',             'ctermbg': 'none',            'cterm': 'none'      },
  \ 'PmenuSel'   : { 'ctermfg': s:LightForeground, 'ctermbg': 'none',            'cterm': 'none'      },
  \ 'Search'     : { 'ctermfg': 'none',            'ctermbg': 'none',            'cterm': 'underline' },
  \ 'StatusLine' : { 'ctermfg': s:LightForeground, 'ctermbg': 'none',            'cterm': 'none'      },
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

call zenchrome#ClearUndefinedColors(g:Colorscheme)
call zenchrome#SetColors(g:Colorscheme)

augroup zenchrome
  autocmd!
  autocmd Syntax * call zenchrome#ClearUndefinedColors(g:Colorscheme)
  autocmd Colorscheme *
    \ if g:colors_name !=# 'zenchrome'
    \ | autocmd! zenchrome
    \ | endif
augroup END
