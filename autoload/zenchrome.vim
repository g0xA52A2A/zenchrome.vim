function! zenchrome#GetColors()
  let colors = {}
  " Ensure one highlight group per line
  let highlights = substitute(execute('highlight'), '\n\s\+', ' ', 'g')
  for highlight in split(highlights, '\n')
    let group   = split(highlight)[0]
    let values  = split(highlight)[2:]
    if values[0] ==# 'cleared'
      let attributes = 'cleared'
    elseif values[0] ==# 'links'
      let attributes = {'links' : values[-1]}
    else
      let attributes = {}
      call map(values, "split(v:val, '=')")
      call map(values, "{v:val[0]: v:val[1]}")
      call map(values, "extend(attributes, v:val)")
    endif
    let colors[group] = attributes
  endfor
  return colors
endfunction

function! zenchrome#SetColors(colors)
  for highlight in items(a:colors)
    let group       = highlight[0]
    let attributes  = highlight[1]
    if has_key(attributes, 'links')
      execute 'highlight link' group join(values(attributes))
    else
      execute 'highlight' group join(map(items(attributes), "join(v:val, '=')"))
    endif
  endfor
endfunction

function! zenchrome#ClearUndefinedColors(colors)
   for group in keys(filter(zenchrome#GetColors(), '!has_key(a:colors, v:key)'))
     execute 'highlight' group 'NONE'
   endfor
endfunction
