This project adds [CoffeeScript] support to the vim editor. It handles syntax,
indenting, and compiling. Also included is an [eco] syntax and support for
CoffeeScript in HTML.

![Screenshot](http://i.imgur.com/BV29H.png)

[CoffeeScript]: http://jashkenas.github.com/coffee-script/
[eco]: https://github.com/sstephenson/eco

### Simple Installation

This is the quickest way to get things running.

1. Download the latest zipball from [vim.org][zipball-vim] or
   [github][zipball-github].

2. Extract the archive into `~/.vim/`:

        unzip -od ~/.vim vim-coffee-script-HASH.zip

These steps are also used to update the plugin.

[zipball-vim]: http://www.vim.org/scripts/script.php?script_id=3590
[zipball-github]: https://github.com/kchmck/vim-coffee-script/archives/master

### Pathogen Installation

Since this plugin has rolling versions based on git commits, using pathogen and
git is the preferred way to install. The plugin ends up contained in its own
directory, and updates are just a `git pull` away.

1. Install tpope's [pathogen] into `~/.vim/autoload/` and add this line to your
   `vimrc`:

        call pathogen#infect()

    To get the all the features of this plugin, make sure you also have a
    `filetype plugin indent on` line.

[pathogen]: http://www.vim.org/scripts/script.php?script_id=2332

2. Create and change into `~/.vim/bundle/`:

        $ mkdir ~/.vim/bundle
        $ cd ~/.vim/bundle

3. Make a clone of the `vim-coffee-script` repository:

        $ git clone https://github.com/kchmck/vim-coffee-script.git

#### Updating

1. Change into `~/.vim/bundle/vim-coffee-script/`:

        $ cd ~/.vim/bundle/vim-coffee-script

2. Pull in the latest changes:

        $ git pull

### CoffeeMake: Compile the Current File

The `CoffeeMake` command compiles the current file and parses any errors:

  ![CoffeeMake](http://i.imgur.com/OKRKE.png)

  ![CoffeeMake](http://i.imgur.com/PQ6ed.png)

  ![CoffeeMake](http://i.imgur.com/Jp6NI.png)

The full signature of the command is:

    :[silent] CoffeeMake[!] [COFFEE-OPTIONS]...

By default, `CoffeeMake` shows all compiler output and jumps to the first line
reported as an error by `coffee`:

    :CoffeeMake

Compiler output can be hidden with `silent`:

    :silent CoffeeMake

Line-jumping can be turned off by adding a bang:

    :CoffeeMake!

Options given to `CoffeeMake` are passed along to `coffee`:

    :CoffeeMake --bare

#### Recompile on write

To recompile a file when it is written, add an `autocmd` like this to your
`vimrc`:

    au BufWritePost *.coffee silent CoffeeMake!

All of the customizations above can be used, too. This one compiles silently
and with the `-b` option, but shows any errors:

    au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

The `redraw!` command is needed to fix a redrawing quirk in terminal vim, but
can removed for gVim.

#### Default compiler options

The `CoffeeMake` command passes any options in the `coffee_make_options`
variable along to the compiler. You can use this to set default options:

    let coffee_make_options = "--bare"

### CoffeeCompile: Compile Snippets of CoffeeScript

The `CoffeeCompile` command shows how the current file or a snippet of
CoffeeScript is compiled to JavaScript. The full signature of the command is:

    :[RANGE] CoffeeCompile [watch|unwatch] [vert[ical]] [WINDOW-SIZE]

Calling `CoffeeCompile` without a range compiles the whole file:

  ![CoffeeCompile](http://i.imgur.com/pTesp.png)

  ![Compiled](http://i.imgur.com/81QMf.png)

Calling `CoffeeCompile` with a range, like in visual mode, compiles the selected
snippet of CoffeeScript:

  ![CoffeeCompile Snippet](http://i.imgur.com/Rm7iu.png)

  ![Compiled Snippet](http://i.imgur.com/KmrG8.png)

This scratch buffer can be quickly closed by hitting the `q` key.

Using `vert` splits the CoffeeCompile buffer vertically instead of horizontally:

    :CoffeeCompile vert

The initial size of the CoffeeCompile buffer can be given as a number:

    :CoffeeCompile 4

#### Watch (live preview) mode

Watch mode brings to vim the "Try CoffeeScript" live preview box on the
CoffeeScript homepage (or something like it):

  ![Watch Mode](http://i.imgur.com/wIN6h.png)
  ![Watch Mode](http://i.imgur.com/GgdCo.png)
  ![Watch Mode](http://i.imgur.com/QdpAP.png)

Use `watch` to start watching a buffer (`vert` is also recommended):

    :CoffeeCompile watch vert

After making some changes in insert mode, hit escape and the CoffeeScript will
be recompiled. Changes made outside of insert mode don't trigger this recompile,
but calling `CoffeeCompile` will compile these changes without any bad effects.

To get synchronized scrolling of a CoffeeScript and CoffeeCompile buffer, set
`scrollbind` on each:

    :setl scrollbind

Use `unwatch` to stop watching a buffer:

    :CoffeeCompile unwatch

### CoffeeRun: Run some CoffeeScript

The `CoffeeRun` command compiles the current file or selected snippet and runs
the resulting JavaScript. Output is shown at the bottom of the screen:

  ![CoffeeRun](http://i.imgur.com/d4yXC.png)

  ![CoffeeRun Output](http://i.imgur.com/m6UID.png)

### Configuration

You can configure plugin behavior by adding the relevant lines to your `vimrc`.

#### Disable trailing whitespace error

Trailing whitespace is highlighted as an error by default. This can be disabled
with:

    hi link coffeeSpaceError NONE

#### Disable trailing semicolon error

Trailing semicolons are also considered an error (for help transitioning from
JavaScript.) This can be disabled with:

    hi link coffeeSemicolonError NONE

#### Disable reserved words error

Reserved words like `function` and `var` are highlighted as an error where
they're not allowed in CoffeeScript. This can be disabled with:

    hi link coffeeReservedError NONE

### Tuning Vim for CoffeeScript

Changing these core settings can make vim more CoffeeScript friendly.

#### Fold by indentation

Folding by indentation works well for CoffeeScript functions and classes:

  ![Folding](http://i.imgur.com/lpDWo.png)

To fold by indentation in CoffeeScript files, add this line to your `vimrc`:

    au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

With this, folding is disabled by default but can be quickly toggled per-file
by hitting `zi`. To enable folding by default, remove `nofoldenable`:

    au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

#### Two-space indentation

To get standard two-space indentation in CoffeeScript files, add this line to
your `vimrc`:

    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
