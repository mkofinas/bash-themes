# bash-themes
A set of themes for bash shell

## Installation
These themes depend on [a set of scripts](https://github.com/mkofinas/prompt-support)
in order to be used. To download and use them, paste the following commands in
your terminal:

```sh
mkdir -p ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/mkofinas/bash-themes.git
git clone https://github.com/mkofinas/prompt-support.git
```

Afterwards, add these lines in your `.bashrc`:

```sh
BASH_THEME="two_sides_background"

if [ -f ~/.dotfiles/bash-themes/${BASH_THEME}.theme.bash ]; then
    . ~/.dotfiles/bash-themes/${BASH_THEME}.theme.bash
fi

if [ -f ~/.dotfiles/bash-themes/theme_plugins.bash ]; then
    . ~/.dotfiles/bash-themes/theme_plugins.bash
fi
```

The `.dotfiles` folder can be substituted by any other name.

## Provided Themes
Up to this moment, there are 3 provided themes:
- basic
- continuation
- two_lines_background

In order to use one of them, modify the `BASH_THEME` variable in your `.bashrc`
accordingly.

## License
(The MIT License)

Copyright (c) 2015 Miltiadis Kofinas.
