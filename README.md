VimConf
=======

A vimrc file and different bundles. This vim setup requires at least Vim 7.3+ compiled with python & multibyte support.

The font used when running gVim is [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html "Inconsolata"); the OpenType file is included in this repo.

The config uses [neobundle](https://github.com/Shougo/neobundle.vim "neobundle") for installing and updating bundled modules.

For Tagbar to work well with JavaScript (and probably other languages), we **highly** recommend installing the latest version of [Exuberant Ctags](http://ctags.sourceforge.net/ "Exuberant Ctags").

For Syntastic to check syntax of different file types, you optionally need to have a PHP runtime, JSHint, and/or PyFlakes installed.

Requirements
------------

 * Vim 7.3 compiled with python & multibyte support.
 * An up to date installation of git.

Setup
-----

Check out VimConf to your home folder like so:

```bash
$> cd ~
$> git clone --recursive git://github.com/beardedprojamz/VimConf.git
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
$> cd VimConf/.vim/bundle/neobundle.vim 
$> git checkout master
```

Now open vim - when you do this NeoBundle will ask to install all the plugins listed in vimrc. You can update these at any time from inside vim by running:

```bash
:NeoBundleUpdate
```

**Bundle List**

* [go-vim](https://github.com/uggedal/go-vim "go-vim")
* [neobundle](https://github.com/Shougo/neobundle.vim "neobundle") 
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter "nerdcommenter")
* [php.vim--Garvin](https://github.com/vim-scripts/php.vim--Garvin "php.vim--Garvin")
* [python-mode](https://github.com/klen/python-mode "python-mode")
* [syntastic](https://github.com/scrooloose/syntastic "syntastic")
* [tagbar](https://github.com/majutsushi/tagbar "tagbar")
* [unite](https://github.com/Shougo/unite.vim.git "unite")
* [vim-abolish](https://github.com/tpope/vim-abolish "vim-abolish")
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script "vim-coffee-script")
* [vim-colors-blayden](https://github.com/beardedprojamz/vim-colors-blayden "vim-colors-blayden")
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized "vim-colors-solarized")
* [vim-fugitive](https://github.com/tpope/vim-fugitive "vim-fugitive")
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter "vim-gitgutter")
* [vim-gocode](https://github.com/Blackrush/vim-gocode "vim-gocode") - Requires [gocode](https://github.com/nsf/gocode)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides "vim-indent-guides")
* [vim-javascript](https://github.com/pangloss/vim-javascript "vim-javascript")
* [vim-less](https://github.com/groenewege/vim-less "vim-less")
* [vim-puppet](https://github.com/rodjek/vim-puppet "vim-puppet")
* [vim-repeat](https://github.com/tpope/vim-repeat "vim-repeat")
* [vim-surround](https://github.com/tpope/vim-surround "vim-surround")
* [vimproc](https://github.com/Shougo/vimproc.vim.git "vimproc")

Color Schemes
-------------

* **blayden** *Default*
* **solarized** *Can be set in .vimrc_custom - follow instructions at [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized "vim-colors-solarized")*

Keybindings and Commands
-------------------------------

**NERDCommenter Default Mappings**

The below mappings are default in NERDCommenter, and the ones most used, so they are included in our README.

| Keys                       | Command                                             |
|---------------------------:|:----------------------------------------------------|
| **,c[spacebar]**           | Toggles comment state of the selected line(s)       |
| **,cl**                    | Comment current line or text selected in visual mode (forces nesting) |
| **,cu**                    | Uncomment selected lines(s) |

**RopeVim and Python Commands**

To use Rope you need to build the project: `:RopeOpenProject` and `:RopeAnalyzeModules`.
Make sure you add anything your project needs, path wise. For example, run `:RopeProjectConfig`
and add the paths:
```python
     # You can extend python path for looking up modules
     prefs.add('python_path', 'lib')
```

| Keys                       | Command                                             |
|---------------------------:|:----------------------------------------------------|
| **C-space**                | Autocomplete as you type. |
| **,g**                     | Go to definition of object under cursor. |
| **,d**                     | Display documentation of object under cursor. |
| **,b**                     | Insert PDB|iPDB|PuDB set_trace() breakpoint. |
| **[[** or **]]**           | Next/previous class or global function. |
| **[M** or **]M**           | Next/previous method. |

See [python-mode](https://github.com/klen/python-mode) for more shortcuts and options.

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
|**,p**                      | Set paste nonumber for easy copy & pasting in a terminal |
|**,np**                     | Set nopaste number to go back normal editing mode |
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
|**,O**                      | Insert a newline before the current line without entering insert mode |
|**,o**                      | Insert a newline after the current line without entering insert mode |
|**,[spacebar] [character]** | Insert a character in place without entering insert mode |
|**,a [character]**          | Appends a character in place without entering insert mode |
|**,ws**                     | Runs TrimWS and retab on the current buffer |
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
