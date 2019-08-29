" Clear all colors by passing an empty dictionary. Allows us to avoid setting
" attributes in our theme just to override Vim's defaults in highlight groups.
call zenchrome#ClearUndefinedColors({})

call zenchrome#SetColors(g:Colorscheme)

augroup zenchrome
  autocmd!
  autocmd Syntax * call zenchrome#ClearUndefinedColors(g:Colorscheme)
  autocmd Colorscheme zenchrome call zenchrome#ClearUndefinedColors(g:Colorscheme)
augroup END

