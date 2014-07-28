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
