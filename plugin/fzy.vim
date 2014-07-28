if exists('g:loaded_fzy')
  finish
endif

let g:loaded_fzy = 1

command! FzyLsAg :call fzy#execute('ag -l -g "" --nocolor | fzy', 'edit')
command! FzyTag :call fzy#execute('cat tags | cut -f 1,5 | fzy | cut -f 1', 'tag')
