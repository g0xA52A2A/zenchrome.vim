function! zenchrome#GetColors()
  let colors = {}
  " Ensure one highlight group per line
  let highlights = substitute(execute('highlight'), '\n\s\+', ' ', 'g')
  let highlights = split(highlights, '\n')
  call map(highlights, "split(v:val, '\\s\\+xxx\\s\\+')")
  call map(highlights, "[copy(v:val)[0], split(copy(v:val)[1])]")
  for [group, values] in highlights
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

function! zenchrome#SetColors(colorscheme)
  for [group, attributes] in items(a:colorscheme)
    if has_key(attributes, 'links')
      execute 'highlight link' group join(values(attributes))
    else
      execute 'highlight' group join(map(items(attributes), "join(v:val, '=')"))
    endif
  endfor
endfunction

function! zenchrome#ClearUndefinedColors(colorscheme)
  let colors = zenchrome#GetColors()
  let undefined_groups = keys(filter(copy(colors), '!has_key(a:colorscheme, v:key)'))
  for group in undefined_groups
    execute 'highlight' group 'NONE'
  endfor
endfunction
