VimConf
=======

A vimrc file and different bundles. This vim setup requires at least Vim 7.3+ compiled with python & multibyte support.

The font used when running gVim is [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html "Inconsolata"); the OpenType file is included in this repo.

The config uses [neobundle](https://github.com/Shougo/neobundle.vim "neobundle") for installing and updating bundled modules.

For Tagbar to work well with JavaScript (and probably other languages), we **highly** recommend installing the latest version of [Exuberant Ctags](http://ctags.sourceforge.net/ "Exuberant Ctags").

For Syntastic to check syntax of different file types, you optionally need to have a PHP runtime, JSHint, and/or PyFlakes installed.

Requirements
------------

 * Vim 7.3+ compiled with python & multibyte support.
 * An up to date installation of git.

Setup
-----

Check out VimConf to your home folder like so:

```bash
$> cd ~
$> git clone --recursive git://github.com/IntuitiveWebSolutions/VimConf.git
```

Then create symlinks to the files inside the repo:

```bash
$> ln -s ~/VimConf/.vim ~/.vim
$> ln -s ~/VimConf/.vimrc ~/.vimrc
$> ln -s ~/VimConf/.vimrc_custom ~/.vimrc_custom
$> ln -s ~/VimConf/.gvimrc ~/.gvimrc
```

That way, any time you want to update to the latest versions of the VimConf, you can just `git pull` inside the VimConf folder.

```bash
$> cd ~/VimConf/
$> git pull
```

NeoBundle
---------

[NeoBundle](https://github.com/Shougo/neobundle.vim "neobundle") is the tool used to pull in all the plugins below. Make sure that the bundle is checked out (it is a submodule), and check out 'master'.

```bash
$> cd VimConf
$> git pull
$> git submodule init
$> git submodule update
$> cd ~/VimConf/.vim/bundle/neobundle.vim
$> git checkout master
```

Now open vim - when you do this NeoBundle will ask to install all the plugins listed in vimrc. You can update these at any time from inside vim by running:

```bash
:NeoBundleUpdate
```

**Bundle List**

* [vim-gitgutter](https://github.com/airblade/vim-gitgutter "vim-gitgutter")
* [vim-airline](https://github.com/bling/vim-airline "vim-airline")
* [jedi-vim](https://github.com/davidhalter/jedi-vim "jedi-vim")
* [js-beautify](https://github.com/einars/js-beautify "js-beautify")
* [vim-json](https://github.com/elzr/vim-json "vim-json")
* [supertab](https://github.com/ervandew/supertab "supertab")
* [vim-go](https://github.com/fatih/vim-go "vim-go")
* [todo.txt-vim](https://github.com/freitass/todo.txt-vim "todo.txt-vim")
* [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax "Vim-Jinja2-Syntax")
* [vim-less](https://github.com/groenewege/vim-less "vim-less")
* [vim-snippets](https://github.com/honza/vim-snippets "vim-snippets")
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script "vim-coffee-script")
* [python-mode](https://github.com/klen/python-mode "python-mode")
* [vim-howdoi](https://github.com/laurentgoudet/vim-howdoi "vim-howdoi")
* [tagbar](https://github.com/majutsushi/tagbar "tagbar")
* [vim-jsbeautify](https://github.com/maksimr/vim-jsbeautify "vim-jsbeautify")
* [emmet-vim](https://github.com/mattn/emmet-vim "emmet-vim")
* [vim-startify](https://github.com/mhinz/vim-startify "vim-startify")
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides "vim-indent-guides")
* [vim-javascript](https://github.com/pangloss/vim-javascript "vim-javascript")
* [vim-markdown](https://github.com/plasticboy/vim-markdown "vim-markdown")
* [vim-puppet](https://github.com/rodjek/vim-puppet "vim-puppet")
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter "nerdcommenter")
* [syntastic](https://github.com/scrooloose/syntastic "syntastic")
* [neobundle](https://github.com/Shougo/neobundle.vim "neobundle")
* [unite](https://github.com/Shougo/unite.vim "unite")
* [vimproc](https://github.com/Shougo/vimproc "vimproc")
* [vimshell](https://github.com/Shougo/vimshell.vim "vimshell")
* [ultisnips](https://github.com/SirVer/ultisnips "ultisnips")
* [ag](https://github.com/smeggingsmegger/ag.vim "ag")
* [vim-colorschemes](https://github.com/smeggingsmegger/vim-colorschemes "vim-colorschemes")
* [vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako "vim-bundle-mako")
* [dwm](https://github.com/spolu/dwm.vim "dwm")
* [php](https://github.com/StanAngeloff/php.vim "php")
* [vim-abolish](https://github.com/tpope/vim-abolish "vim-abolish")
* [vim-fugitive](https://github.com/tpope/vim-fugitive "vim-fugitive")
* [vim-repeat](https://github.com/tpope/vim-repeat "vim-repeat")
* [vim-surround](https://github.com/tpope/vim-surround "vim-surround")
* [YouCompleteMe.git](https://github.com/Valloric/YouCompleteMe.git "YouCompleteMe.git")

Color Schemes
-------------

* **blayden** *Default*
* **jellybean** *Can be set in .vimrc_custom*
* **solarized** *Can be set in .vimrc_custom - follow instructions at [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized "vim-colors-solarized")*

Window Management
-------------------------------
Windows are always organised as follows:

```
===================================
|              |        S1        |
|              |===================
|      M       |        S2        |
|              |===================
|              |        S3        |
===================================
```

Use the following commands to create, browse and close windows:

`C-N` Creates a new window and place it in the master pane [M] & stacks all previous windows in the stacked pane [S]
`C-C` Close the current window if no unsaved changes
`C-J` Jumps to next window (clockwise)
`C-K` Jumps to previous window (anti-clockwise)
`C-Space` Focus the current window, that is, place it in the master pane [M] & stacks all other windows in the stacked pane [S]

Keybindings and Commands
-------------------------------

**NERDCommenter Default Mappings**

The below mappings are default in NERDCommenter, and the ones most used, so they are included in our README.

| Keys                       | Command                                             |
|---------------------------:|:----------------------------------------------------|
| **,c[spacebar]**           | Toggles comment state of the selected line(s)       |
| **,cl**                    | Comment current line or text selected in visual mode (forces nesting) |
| **,cu**                    | Uncomment selected lines(s) |

**JavaScript Commands**

| Keys                       | Command                                             |
|---------------------------:|:----------------------------------------------------|
| **,b**                     | Insert 'debugger;' breakpoint. |


**Custom Mappings**

| Keys                       | Command                                             |
|---------------------------:|:----------------------------------------------------|
|**gh**                      | GitGutter Next Hunk |
|**gH**                      | GitGutter Previous Hunk |
|**,,**                      | Toggles comment state of the selected line(s) |
|**,si**                     | Adds a 'Signature' to the end of the line. Ex. ' -- Ben Hayden 5/14/2012' |
|**,tc**                     | Close tab |
|**,tn**                     | Next tab |
|**,tp**                     | Previous tab |
|**,te**                     | Edit new tab |
|**,l**                      | Navigate buffers |
|**,/**                      | Grep in the current directory |
|**,y**                      | Show yank buffers to paste from |
|**,nt**                     | Open Netrw in a vertical split |
|**,tb**                     | Toggle Tagbar plugin |
|**,e**                      | Open Syntastic Error Location List |
|**,en**                     | Go to next error |
|**,ep**                     | Go to previous error |
|**,ig**                     | Toggle IndentGuides plugin |
|**,ml**                     | Compile LESS file to CSS. Requires NPM install of less |
|**,p**                      | Toggle paste mode (for easy copy & pasting in a terminal) |
|**,ln**                     | Toggle line numbers (for easy copying out of terminal) |
|**,xp**                     | Put (Paste) from system clipboard |
|**,xy**                     | Yank (Copy) to system clipboard |
|**,xx**                     | Cut to system clipboard |
|**,s**                      | Write file |
|**,ev**                     | Edit $MYVIMRC |
|**,sv**                     | Source $MYVIMRC |
|**,sp**                     | Turn on Spell checking for EN_US |
|**,nsp**                    | Turn off Spell checking for EN_US |
|**,q**                      | Write & quit file |
|**,rf**                     | Turn Syntax off/on on a file - a "refresh" of the syntax highlighting |
|**,v**                      | Vertical split window |
|**,h**                      | Horizontal split window |
|**,cw**                     | Close window |
|**,w**                      | Closes all but the current window |
|**,bd**                     | Delete (close) buffer |
|**,ch**                     | Clear (turn off) highlighting |
|**,rt**                     | Re-tab entire file. (Shortcut for gg=G) |
|**,hb**                     | Send selected visual hunk to hastebin |
|**,0**                      | Go to the first character of a line |
|**,O**                      | Insert a newline before the current line without entering insert mode |
|**,o**                      | Insert a newline after the current line without entering insert mode |
|**,[spacebar] [character]** | Insert a character in place without entering insert mode |
|**,a [character]**          | Appends a character in place without entering insert mode |
|**,ws**                     | Runs TrimWS and retab on the current buffer |
|**,j**                      | Reformat JSON automatically (Requires python command in system path) |
|**:W**                      | Write as super user |
|**:Tabs2Spaces**            | Convert tab characters to 4 space characters |
|**shift + down arrow**      | Jump down 10 lines |
|**shift + up arrow**        | Jump up 10 lines |
|**control + h**             | Switch to left window |
|**control + j**             | Switch to bottom window |
|**control + k**             | Switch to top window |
|**control + l**             | Switch to right window |
|**control + p**             | Run Unite file |
|**visual selection + \**    | Visual Selection Search with // |
|**visual selection + #**    | Visual Selection Search with ?? |

Emmet is Awesome
-------------------------------

1. Expand an Abbreviation

  Type the abbreviation as 'div>p#foo$*3>a' and type '<c-y>,'.
```html
  <div>
      <p id="foo1">
          <a href=""></a>
      </p>
      <p id="foo2">
          <a href=""></a>
      </p>
      <p id="foo3">
          <a href=""></a>
      </p>
  </div>
```
2. Wrap with an Abbreviation

  Write as below.
```
  test1
  test2
  test3
```

  Then do visual select(line wise) and type '<c-y>,'.
  Once you get to the 'Tag:' prompt, type 'ul>li*'.

```html
  <ul>
      <li>test1</li>
      <li>test2</li>
      <li>test3</li>
  </ul>
```

  If you type a tag, such as 'blockquote', then you'll see the following:

```
  <blockquote>
      test1
      test2
      test3
  </blockquote>
```

3. Balance a Tag Inward

  type '<c-y>d' in insert mode.

4. Balance a Tag Outward

  type '<c-y>D' in insert mode.

5. Go to the Next Edit Point

  type '<c-y>n' in insert mode.

6. Go to the Previous Edit Point

  type '<c-y>N' in insert mode.
