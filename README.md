#fzy-vim

A vim plugin to add commands for fzy inside of vim!

#Installation

You know the drill, use your favorite vim package manager, vundle or pathogen, to add fzy-vim.
dependant on [fzy](https://github.com/jhawthorn/fzy) (obvs).

#Features

Fzy-vim doesn't come with any built in keybindings. To be honest it doesn't do much.

##Commands
- `FzyLsAg` - list files using the silversearcher, respects .gitignore and .agignore and open it in the current buffer.
- `FzyTag` - list tags, open tag defintion in current buffer - a better :tselect.
- `FzyWorkingTree` - list all currently modified files and open in current buffer.
- `FzyGem` - list all gems, then list all files in the selected gem.
- `FzyBuffer` - fzy select :ls

All of these commands, excluding FzyBuffer which is pending; have tab, vertical, and split variants; which start with either 'T', 'V', or 'S'; respectively.
eg: `FzyTag`, `TFzyTag`, `VFzyTag`, `SFzyTag`

##Functions
- `fzy#exectute(shell_command, vim_command)` - shells out the command and pipes it's output back into the vim command, note shell_command must also include `fzy`
eg: `:call fzy#execute('ag -l -g "" --nocolor | fzy', 'edit')`
this is done so you can do further transformations with the output of fzy, before it's returned to vim.
