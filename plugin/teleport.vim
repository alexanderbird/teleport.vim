function! teleport#Teleport(path)
  let l:parts = split(a:path, ':')
  let l:path = get(l:parts, 0, '')
  let l:line = get(l:parts, 1, '')
  let l:column = get(l:parts, 2, '')
  if len(l:path)
    if(expand('%:p') != fnamemodify(l:path, ':p'))
      exec 'edit ' . l:path
    endif
    if len(l:line)
      let l:position = l:line . 'G' . l:column . '|'
      exec 'normal ' . l:position
    endif
  else
    echoerr 'Teleport expects a path (and optional line + column) arguments, got path:' . l:path . ' line:' . l:line . ' column:' . l:column
    return
  endif
endfunction

command! -nargs=1 -complete=file Teleport call teleport#Teleport(<q-args>)
