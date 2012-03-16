VimConf
=======

A vimrc file and different bundles. This vim setup requires at least Vim 7.3 compiled with python & multibyte support.

The font used when running gVim is [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html "Inconsolata"); the OpenType file is included in this repo.

The config uses [pathogen](https://github.com/tpope/vim-pathogen "pathogen") for automatically adding the below bundles to the Vim runtimepath.

To generate the documentation tags for each plugin, run **:Helptags**.

For Tagbar to work well with JavaScript (and probably other languages), we **highly** recommend installing the latest version of [Exuberant Ctags](http://ctags.sourceforge.net/ "Exuberant Ctags").

For Syntastic to check syntax of different file types, you optionally need to have a PHP runtime, JSHint, and/or PyFlakes installed.

Setup
-----

Check out VimConf to your home folder like so:

> cd ~

> git clone --recursive git://github.com/beardedprojamz/VimConf.git

Then create symlinks to the files inside the repo:

> ln -s ~/VimConf/.vim ~/.vim

> ln -s ~/VimConf/.vimrc ~/.vimrc

> ln -s ~/VimConf/.vimrc_custom ~/.vimrc_custom

> ln -s ~/VimConf/.gvimrc ~/.gvimrc

That way, any time you want to update to the latest versions of the VimConf, you can just **git pull** inside the VimConf folder.

> cd ~/VimConf/

> git pull

Bundle List
-----------

All of these are loaded as git submodules as of 01/19/2012 so if your repo is older than that you will need to go into your checkout and do the below commands for things to work:

> git pull

> git submodule init

> git submodule update

If you haven't checked out the repo yet, be sure and clone it with the --recursive flag and it will grab everything.

* [conque-shell](https://github.com/vim-scripts/Conque-Shell "conque-shell")
* [nerdtree](https://github.com/scrooloose/nerdtree "nerdtree")
* [php.vim--Garvin](https://github.com/vim-scripts/php.vim--Garvin "php.vim--Garvin")
* [python.vim--Vasiliev](https://github.com/vim-scripts/python.vim--Vasiliev "python.vim--Vasiliev")
* [python.vim](https://github.com/vim-scripts/python.vim "python.vim")
* [simplecommenter](https://github.com/vim-scripts/simplecommenter "simplecommenter")
* [syntastic](https://github.com/scrooloose/syntastic "syntastic")
* [tagbar](https://github.com/majutsushi/tagbar "tagbar")
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides "vim-indent-guides")
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script "vim-coffee-script")
* [vim-javascript](https://github.com/pangloss/vim-javascript "vim-javascript")
* [vim-surround](https://github.com/tpope/vim-surround "vim-surround")
* [vim-repeat](https://github.com/tpope/vim-repeat "vim-repeat")
* [vim-abolish](https://github.com/tpope/vim-abolish "vim-abolish")

Color Scheme
------------

**blayden** - inspired by [herald](https://github.com/vim-scripts/herald "herald") and [molokai](https://github.com/vim-scripts/molokai "molokai") color schemes. The scheme is built for a 256 color terminal or gVim, but will work with less colors.

Custom Keybindings and Commands
-------------------------------

* **,,** *Toggle single line comment*
* **,c** *Comment line*
* **,C** *Uncomment line*
* **,tc** *Close tab*
* **,tn** *Next tab*
* **,tp** *Previous tab*
* **,te** *Edit new tab*
* **,ln** *Toggle Line Numbers*
* **,nt** *Toggle NERDTree plugin*
* **,tb** *Toggle Tagbar plugin*
* **,e**  *Open Syntastic Error Location List*
* **,en** *Go to next error.*
* **,ep** *Go to previous error.*
* **,ig** *Toggle IndentGuides plugin*
* **,p** *Set paste nonumber for easy copy & pasting in a terminal*
* **,np** *Set nopaste number to go back normal editing mode*
* **,s**  *Write file*
* **,sp**  *Turn on Spell checking for EN_US*
* **,nsp**  *Turn off Spell checking for EN_US*
* **,q**  *Write & quit file*
* **,r** *Turn Syntax off/on on a file - a "refresh" of the syntax highlighting*
* **,v** *Visual split window*
* **,h** *Turn off highlighting*
* **,O** *Insert a newline before the current line without entering insert mode*
* **,o** *Insert a newline after the current line without entering insert mode*
* **,[spacebar] [character]** *Insert a character in place without entering insert mode*
* **,a [character]** *Appends a character in place without entering insert mode*
* **,pdb** *Inserts pdb.set_trace() in Python files*
* **,bp** *Run a bpython shell inside of Vim in a vertical split*
* **,ip** *Run an ipython shell inside of Vim in a vertical split*
* **,ws** *Runs both Tabs2Spaces & TrimWS on the current buffer*
* **:W** *Write as super user*
* **:Tabs2Spaces** *Convert tab characters to 4 space characters*
* **:TrimWS** *Trim trailing whitespace*
* **shift + down arrow** *Jump down 10 lines*
* **shift + up arrow** *Jump up 10 lines*
* **control + h** *Switch to left window*
* **control + j** *Switch to bottom window*
* **control + k** *Switch to top window*
* **control + l** *Switch to right window*
* **visual mode selection + \*** *Visual Selection Search with //*
* **visual mode selection + #** *Visual Selection Search with ??*
