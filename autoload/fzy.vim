if exists('g:autoloaded_fzy')
  finish
endif

let g:autoloaded_fzy = 1

function! fzy#execute(shell_command, vim_command)
  let output = ''

  silent let output = system(a:shell_command)

  redraw!

  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

function! fzy#fzy_buffer()
  let tmp = tempname()

  exec 'redir > '.tmp | silent ls | redir END

  let $V_BUFFER_FILE = tmp
  let shell_cmd = 'cat $V_BUFFER_FILE |' .
        \ 'tail -n +2 |' .
        \ 'sed -r ''s/.*"(.+)".*/\1/'' |' .
        \ 'fzy'

 :call fzy#execute(shell_cmd, 'buffer')
endfunction

function! fzy#variable_command(shell_cmd, prefixes, name)
  for [prefix, excmd] in items(a:prefixes)

    if prefix == 'default'
      let prefix = ''
    endif

    let cmd_name = prefix.a:name
    exec 'command! ' . cmd_name .
          \ ' :call fzy#execute("' . a:shell_cmd . '", "' . excmd . '")'
  endfor
endfunction
