let g:colors_name='zenchrome'

if !exists('*Colors')
  function! Colors() abort
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
      \ 'Normal'       : { 'ctermfg': s:Foreground, 'ctermbg': s:Background },
      \ 'Visual'       : { 'ctermfg': s:Background, 'ctermbg': s:LightForeground },
      \
      \ 'CursorLine'   : { 'cterm': 'underline' },
      \
      \ 'Constant'     : { 'ctermfg': s:LightForeground },
      \
      \ 'Boolean'      : { 'links': 'Constant' },
      \ 'Float'        : { 'links': 'Constant' },
      \ 'Number'       : { 'links': 'Constant' },
      \ 'PmenuSel'     : { 'links': 'Constant' },
      \ 'QuickFixLine' : { 'links': 'Constant' },
      \ 'StatusLine'   : { 'links': 'Constant' },
      \ 'String'       : { 'links': 'Constant' },
      \
      \ 'Error'        : { 'ctermfg': 'LightRed' },
      \
      \ 'SpellBad'     : { 'links': 'Error' },
      \ 'SpellCap'     : { 'links': 'Error' },
      \ 'Todo'         : { 'links': 'Error' },
      \ 'WarningMsg'   : { 'links': 'Error' },
      \
      \ 'Search'       : { 'cterm': 'underline' },
      \
      \ 'IncSearch'    : { 'links': 'Search' },
      \ }
  endfunction
endif

call Colors() | call zenchrome#Sync()

augroup Zenchrome
  autocmd!
  autocmd VimEnter * call Colors() | call zenchrome#Sync()
  autocmd Syntax * call zenchrome#Sync()
  autocmd Colorscheme *
    \ if g:colors_name !=# 'zenchrome'
    \ | autocmd! Zenchrome
    \ | endif
augroup END
