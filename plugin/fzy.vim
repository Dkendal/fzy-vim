if exists('g:loaded_fzy')
  finish
endif

let g:loaded_fzy = 1

command! -nargs=? -complete=dir FzyLsAg :call fzy#execute('ag -l -g "" --nocolor ' . <q-args> . ' | fzy', 'edit')
command! FzyTag :call fzy#execute('cat tags | cut -f 1,5 | fzy | cut -f 1', 'tag')
command! FzyGem :call fzy#execute("ag -g '' $(bundle list | tr -s ' ' | tail -n +2 | sed 's/...//' | fzy | cut -d ' ' -f 1 | xargs -I {} bundle show {}) | fzy", 'edit')
command! FzyWorkingTree :call fzy#execute("git status --porcelain --ignore-submodules | fzy | sed 's/...//'", 'edit')
