function! zenchrome#Sync() abort
  let colors = {}
  call map(zenchrome#helpers#Lex(),
    \ "extend(colors, zenchrome#helpers#Parse(v:val))")
  call zenchrome#helpers#Sync(colors)
endfunction
