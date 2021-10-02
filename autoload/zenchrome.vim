function! s:Lex() abort
  let highlights = execute('highlight')
  let highlights = substitute(highlights, '\n\s\+', ' ', 'g')
  let highlights = split(highlights, '\n')
  call map(highlights, "split(v:val, '\\s\\+xxx\\s\\+')")
  call map(highlights, "[copy(v:val)[0], split(copy(v:val)[1])]")
  return highlights
endfunction

function! s:Parse(highlight) abort
  let [group, values] = a:highlight
  let attributes = {}
  if values[0] ==# 'links'
    let attributes = {'links' : values[-1]}
  elseif values[0] !=# 'cleared'
    call map(values, "split(v:val, '=')")
    call map(values, "{v:val[0]: v:val[1]}")
    call map(values, "extend(attributes, v:val)")
  endif
  return {group : attributes}
endfunction

function! s:Set(group, ...) abort
  execute 'highlight' a:group 'NONE'
  if a:0
    execute 'highlight' join(has_key(a:1, 'links') ?
      \ ['link', a:group, join(values(a:1))] :
      \ [        a:group, join(map(items(a:1), "join(v:val, '=')"))])
  endif
endfunction

function! s:Sync(colors) abort
  call map(filter(copy(g:Colorscheme), "a:colors[v:key] !=# v:val"),
    \      "s:Set(v:key, v:val)")
  call map(filter(keys(a:colors), "!has_key(g:Colorscheme, v:val)"),
    \      "s:Set(v:val)")
endfunction

function! zenchrome#Sync() abort
  let colors = {}
  call map(s:Lex(), "extend(colors, s:Parse(v:val))")

  call s:Sync(colors)
endfunction
