" Notes {
"   Ben Hayden
"   https://github.com/beardedprojamz/VimConf
"}

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    colorscheme blayden " set our customized colorscheme
    syntax on " syntax highlighting on
    runtime bundle/vim-pathogen/autoload/pathogen.vim " Enable pathogen for fancy plugin management
    call pathogen#infect() " Append .vim/bundles apps
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set backupdir=~/.vim/backup " where to put backup files
    set directory=~/.vim/tmp " directory to place swap files in
    set fileformats=unix,mac,dos " support all three, in this order
    set hidden " you can change buffers without saving
    if has("mouse")
        set mouse=a " use mouse everywhere
    endif
    set noerrorbells " don't make noise when something errors
    if has("persistent_undo")
        set undofile " enable file undoing
        set undodir=~/.vim/undo " where to put undo files
    endif
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
    " Re-open VIM to the last spot you had open.
    if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g'\"" | endif
    endif
" }

" Vim UI {
    set cursorline " highlight current line
    set hlsearch " highlight searched for phrases
    set incsearch " highlight as you type you
                   " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines
                     " betweens rows
    set list " we do what to show tabs, to ensure we get them
              " out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink
                     " matching brackets for
    set nostartofline " leave my cursor where it was
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=   " clear the statusline for when vimrc is reloaded
    set statusline+=%-3.3n\                      " buffer number
    set statusline+=%<%.99f\                     " file name up to 99 chars
    set statusline+=%h%m%r%w                     " flags
    set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
    set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
    set statusline+=%{&fileformat}]              " file format
    set statusline+=%=                           " right align
    set statusline+=%b,0x%-8B\                   " current char
    set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
    set statusline+=%#syntodo#%{SyntasticStatuslineFlag()} " Add syntastic status line
" }

" Text Formatting/Layout {
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return,
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent,
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 softtabstop=2 expandtab " For CoffeeScript
    set tabstop=8 " real tabs should be 8, and they will show with
                   " set list on
" }

" Mappings {
    let mapleader = ","
    " Mapping tab commands
    nnoremap <Leader>tc :tabc<return>
    nnoremap <Leader>tn :tabn<return>
    nnoremap <Leader>tp :tabp<return>
    nnoremap <Leader>te :tabe<space>
    " Mapping Plugin commands
    nnoremap <Leader>nt :NERDTreeToggle<return>
    nnoremap <Leader>tb :TagbarToggle<return>
    nnoremap <Leader>e :Errors<return>
    nnoremap <Leader>en :lnext<return>
    nnoremap <Leader>ep :lprev<return>
    " Map Paste / No Number for copying and pasting into Terminal Vim.
    nnoremap <Leader>p :set paste nonumber<return>
    nnoremap <Leader>np :set nopaste number<return>
    " Spell Checking
    nnoremap <Leader>sp :setlocal spell spelllang=en_us<return>
    nnoremap <Leader>nsp :setlocal spell spelllang=<return>
    " Set up Bash / Python Emulator Splits
    nnoremap <Leader>sh :ConqueTermVSplit bash<return>
    nnoremap <Leader>bp :ConqueTermVSplit bpython<return>
    nnoremap <Leader>ip :ConqueTermVSplit ipython<return>
    " Map some convenience commands
    nnoremap <Leader>s :w<return>
    nnoremap <Leader>q :wq<return>
    nnoremap <Leader>v :vsp<space>
    nnoremap <Leader>bd :bd<return>
    nnoremap <Leader>h :noh<return>
    nnoremap <Leader>O O<Esc>
    nnoremap <Leader>o o<Esc>
    nnoremap <S-Down> 10j
    nnoremap <S-Up> 10k
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    nnoremap <Leader>r :syntax off<return>:syntax on<return>
    " Fix all the whitespace in a file. Re-tabs and removes trailing whitespace.
    " Usage: ,ws
    nnoremap <Leader>ws :TrimWS<return>:retab<return>
    " Insert a single character of your choosing and return to the right spot.
    " Usage: ,[spacebar][character]
    nnoremap <Leader><space> :exec "normal i".nr2char(getchar())."\e"<return>
    nnoremap <Leader>a :exec "normal a".nr2char(getchar())."\e"<return>
    " Insert Python PDB line
    au BufNewFile,BufReadPost *.py nnoremap <Leader>pdb :exec "normal oimport pdb; pdb.set_trace()\e"<return>
    " Write as super user
    command W w !sudo tee % > /dev/null
    " Trim trailing whitespace
    command TrimWS %s/\s*$//g | noh
    " Visual Selection Search using * and #
    function! s:VSetSearch()
        let temp = @@
        norm! gvy
        let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
        let @@ = temp
    endfunction
    vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
    vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
    " Plugin Boolean settings for Programming Languages
    let coffee_compile_vert=1 " When compiling CoffeeScript, throw output into vertical split
    let python_highlight_all=1 " Highlight all Python syntax
    let g:syntastic_check_on_open=1 " Run Syntastic when opening files
" }

" Include custom configurations via the .vimrc_custom file
" which is included here:
source $HOME/.vimrc_custom
