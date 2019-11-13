function! s:GetHighlights()
  let highlights  = execute('highlight')
  let highlights  = substitute(highlights, '\n\s\+', ' ', 'g')
  let highlights  = split(highlights, '\n')
  call map(highlights, "split(v:val, '\\s\\+xxx\\s\\+')")
  call map(highlights, "[copy(v:val)[0], split(copy(v:val)[1])]")
  return highlights
endfunction

function! s:GetColors()
  let colors = {}
  for [group, values] in <SID>GetHighlights()
    let attributes = {}
    if values[0] ==# 'links'
      let attributes['links'] = values[-1]
    elseif values[0] !=# 'cleared'
      call map(values, "split(v:val, '=')")
      call map(values, "{v:val[0]: v:val[1]}")
      call map(values, "extend(attributes, v:val)")
    endif
    let colors[group] = attributes
  endfor
  return colors
endfunction

function! s:SetColors(colors)
  for [group, attributes] in items(a:colors)
    execute 'highlight' group 'NONE'
    if has_key(attributes, 'links')
      execute 'highlight link' group join(values(attributes))
    else
      execute 'highlight' group join(map(items(attributes), "join(v:val, '=')"))
    endif
  endfor
endfunction

function! s:SyncColors(colors)
  for [group, attributes] in items(g:Colorscheme)
    if attributes !=# a:colors[group]
      call <SID>SetColors({group: attributes})
    endif
  endfor
endfunction

function! s:ClearUndefinedColors(colors)
  let undefined_groups = filter(keys(a:colors), "!has_key(g:Colorscheme, v:val)")
  call map(undefined_groups, "execute('highlight' . ' ' . v:val . ' ' . 'NONE')")
endfunction

function! zenchrome#Sync()
  let colors = <SID>GetColors()
  call <SID>SyncColors(colors)
  call <SID>ClearUndefinedColors(colors)
endfunction
