VimConf
=======

A vimrc file and different bundles. This vim setup requires at least Vim 7.3 compiled with python (for pyflakes) & multibyte (for tagbar) support.

The font used when running gVim is [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html "Inconsolata"); I've included the OpenType file in this repo.

I use [pathogen](https://github.com/tpope/vim-pathogen "pathogen") for automatically adding the below bundles to the Vim runtimepath. To generate the documentation tags for each plugin, run :Helptags.

Bundle list:

All of these are loaded as git submodules as of 01/19/2012 so if your repo is older than that you will need to git pull, git submodule init, and git submodule update to use them.

If you haven't checked out the repo yet, be sure and clone it with the --recursive flag and it will grab everything.

* [nerdtree](https://github.com/scrooloose/nerdtree "nerdtree")
* [php.vim--Garvin](https://github.com/vim-scripts/php.vim--Garvin "php.vim--Garvin")
* [pyflakes.vim](https://github.com/kevinw/pyflakes-vim "pyflakes") - Requires [pyflakes](https://github.com/kevinw/pyflakes "pyflakes") Python module.
* [python.vim--Vasiliev](https://github.com/vim-scripts/python.vim--Vasiliev "python.vim--Vasiliev")
* [python.vim](https://github.com/vim-scripts/python.vim "python.vim")
* [simplecommenter](https://github.com/vim-scripts/simplecommenter "simplecommenter")
* [tagbar](https://github.com/majutsushi/tagbar "tagbar")
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides "vim-indent-guides")
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script "vim-coffee-script")
* [vim-javascript](https://github.com/pangloss/vim-javascript "vim-javascript")
* [vim-surround](https://github.com/tpope/vim-surround "vim-surround")
* [vim-repeat](https://github.com/tpope/vim-repeat "vim-repeat")
* [vim-abolish](https://github.com/tpope/vim-abolish "vim-abolish")

Colors (looks best with a 256 color terminal or gVim):

* blayden (Default scheme - inspired by herald and molokai schemes)
* [herald](https://github.com/vim-scripts/herald.vim "herald")
* [molokai](https://github.com/vim-scripts/molokai "molokai")

Custom Keybindings and Commands:

* **,,** *Toggle single line comment*
* **,c** *Comment line*
* **,C** *Uncomment line*
* **,tc** *Close tab*
* **,tn** *Next tab*
* **,tp** *Previous tab*
* **,te** *Edit new tab*
* **,p** *Set paste nonumber for easy copy & pasting in a terminal*
* **,np** *Set nopaste number to go back normal editing mode*
* **,nt** *Toggle NERDTree plugin*
* **,tb** *Toggle Tagbar plugin*
* **,ig** *Toggle IndentGuides plugin*
* **,q**  *Write & quit file*
* **,s** *Write file*
* **,r** *Turn Syntax off/on on a file - a "refresh" of the syntax highlighting*
* **,v** *Visual split window*
* **,h** *Turn off highlighting*
* **,O** *Insert a newline before the current line without entering insert mode*
* **,o** *Insert a newline after the current line without entering insert mode*
* **,[spacebar] [character]** *Insert a character in place without entering insert mode*
* **,ws** *Runs both Tabs2Spaces & TrimWS on the current buffer*
* **shift + down arrow** *Jump down 10 lines*
* **shift + up arrow** *Jump up 10 lines*
* **:W** *Write as super user*
* **:Tabs2Spaces** *Convert tab characters to 4 space characters*
* **:TrimWS** *Trim trailing whitespace*
