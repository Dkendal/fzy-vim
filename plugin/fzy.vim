if  exists('g:loaded_fzy')
  finish
endif

let g:loaded_fzy = 1

command! FzyTag
      \ :call fzy#execute(, 'tag')

command! FzyBuffer :call fzy#fzy_buffer()

let s:navigation_prefixes =  {
      \   'V'       : 'vsplit',
      \   'S'       : 'split',
      \   'T'       : 'tabedit',
      \   'E'       : 'edit',
      \   'default' : 'edit',
      \ }

let s:tags_navigation_prefixes = {
      \   'V'       : 'vsplit | tag',
      \   'S'       : 'split | tag',
      \   'T'       : 'tabedit | tag',
      \   'E'       : 'edit | tag',
      \   'default' : 'edit | tag',
      \ }

let s:working_tree_sh = "git status --porcelain --ignore-submodules | fzy | sed 's/...//'"

let s:ls_ag_sh = "ag -l -g '' --nocolor | fzy"

let s:gems_sh = "echo $(cd $(bundle list | tr -s ' ' | tail -n +2 |" .
      \ "sed 's/...//' | cut -d ' ' -f 1 | fzy |" .
      \ "xargs -I {} bundle show {}); echo $PWD/$(ag -g '' | fzy)  )"

let s:tags_sh = 'cat tags | cut -f 1,5 | fzy | cut -f 1'

let s:definitions = {
      \   'FzyWorkingTree' : s:working_tree_sh,
      \   'FzyLsAg' : s:ls_ag_sh,
      \   'FzyGem' : s:gems_sh
      \ }

for [cmd_name, shell_cmd] in items(s:definitions)
  call fzy#variable_command(shell_cmd, s:navigation_prefixes, cmd_name)
endfor

call fzy#variable_command(s:tags_sh, s:tags_navigation_prefixes, 'FzyTag')
