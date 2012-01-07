VimConf
=======

A vimrc file and different bundles. This vim setup requires at least Vim 7.3 compiled with python (for pyflakes) & multibyte (for tagbar) support.

The font used when running gVim is [Inconsolata](http://www.levien.com/type/myfonts/inconsolata.html "Inconsolata"); I've included the OpenType file in this repo.

I use [pathogen](https://github.com/tpope/vim-pathogen "pathogen") for automatically adding the below bundles to the Vim runtimepath. To generate the documentation tags for each plugin, run :Helptags.

Bundle list:

* [nerdtree](https://github.com/scrooloose/nerdtree "nerdtree")
* [pyflakes.vim](https://github.com/kevinw/pyflakes-vim "pyflakes") - Requires [pyflakes](https://github.com/kevinw/pyflakes "pyflakes") Python module.
* [python.vim--Vasiliev](https://github.com/vim-scripts/python.vim--Vasiliev "python.vim--Vasiliev")
* [python.vim](https://github.com/vim-scripts/python.vim "python.vim")
* [simplecommenter](https://github.com/vim-scripts/simplecommenter "simplecommenter")
* [tagbar](https://github.com/majutsushi/tagbar "tagbar")
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides "vim-indent-guides")
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script "vim-coffee-script")
* [vim-javascript](https://github.com/pangloss/vim-javascript "vim-javascript")

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
* **,Nt** *Toggle NERDTree plugin*
* **,Tb** *Toggle Tagbar plugin*
* **,ig** *Toggle IndentGuides plugin*
* **,q**  *Write & quit file*
* **,s** *Write file*
* **,r** *Turn Syntax off/on on a file - a "refresh" of the syntax highlighting*
* **,v** *Visual split window*
* **,h** *Turn off highlighting*
* **,O** *Insert a newline before the current line without entering insert mode*
* **,o** *Insert a newline after the current line without entering insert mode*
* **shift + down arrow** *Jump down 10 lines*
* **shift + up arrow** *Jump up 10 lines*
* **:W** *Write as super user*
* **:Tabs2Spaces** *Convert tab characters to 4 space characters*
* **:TrimWS** *Trim trailing whitespace*
