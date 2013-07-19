" Notes {
"   Ben Hayden, Scott Blevins, Matt Thompson, et al. Public Domain.
"   https://github.com/beardedprojamz/VimConf
"}

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    syntax on " syntax highlighting on
    if has('vim_starting')
           set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    call neobundle#rc(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'beardedprojamz/vim-colors-blayden'
    NeoBundle 'groenewege/vim-less'
    NeoBundle 'kchmck/vim-coffee-script'
    NeoBundle 'kien/ctrlp.vim'
    NeoBundle 'klen/python-mode'
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'nathanaelkane/vim-indent-guides'
    NeoBundle 'pangloss/vim-javascript'
    NeoBundle 'rodjek/vim-puppet'
    NeoBundle 'scrooloose/nerdcommenter'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'tpope/vim-abolish'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'tpope/vim-repeat'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'uggedal/go-vim'
    NeoBundle 'vim-scripts/php.vim--Garvin'
    " vimproc needs a special build
    NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }
    " the plugin indent needs to be on before neobundle runs...
    filetype plugin indent on " load filetype plugins/indent settings
    NeoBundleCheck
    colorscheme blayden " set our customized colorscheme
    set background=dark
    let g:solarized_termtrans=1
    let g:solarized_contrast="high"
" }

" General {
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
    " Set buffer to infinity
    set viminfo='100,h
    " Re-open VIM to the last spot you had open.
    if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g'\"" | endif

        " Jump to the top of git COMMIT_EDITMSG files.
        au BufReadPost COMMIT_EDITMSG
        \ exe "normal! gg"
    endif
    " CtrlP finds a versioned working directory
    let g:ctrlp_working_path_mode = 2
    " Ignore uploads directory in projects for CtrlP
    let g:ctrlp_custom_ignore = '\.git$\|\.svn$\|\uploads$'

    au BufNewFile,BufRead *.save set filetype=sql

    " Unite settings
    let g:unite_enabled_start_insert=1
    let g:unite_source_history_yank_enable=1

    autocmd FileType unite call s:unite_settings()
    function! s:unite_settings()
        " Put settings that execute inside the unite buffer here
    endfunction
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
    set statusline+=%{fugitive#statusline()} " Git fugitive status line
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
    set nosmartindent " turn off smart indent so comments work in Python
    set shiftwidth=4 " auto-indent amount when using cindent,
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 softtabstop=2 " For CoffeeScript
    au BufNewFile,BufReadPost *.go setl noexpandtab tabstop=4 nolist " For Go
    set tabstop=8 " real tabs should be 8, and they will show with
                   " set list on
" }

" Mappings {
    let mapleader = ","
    " Mapping Unite commands
    nnoremap <Leader>/ :Unite grep:.<cr>
    nnoremap <Leader>y :Unite -buffer-name=yank history/yank<cr>
    nnoremap <Leader>l :Unite -buffer-name=buffers -quick-match buffer<cr>
    " Mapping ropevim commands
    nnoremap <Leader>g :call RopeGotoDefinition()<return>
    nnoremap <Leader>d :call RopeShowDoc()<return>
    nnoremap <Leader>f :call RopeFindOccurrences()<return>
    nnoremap <Leader>j :call RopeJumpToGlobal()<return>
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
    " Adding Toggle Comment
    nnoremap <Leader><Leader> :call NERDComment("n", "Toggle")<return>
    vnoremap <Leader><Leader> :call NERDComment("v", "Toggle")<return>
    " Add 'Sign' shortcut
    nnoremap <Leader>si :exec "normal A".system("echo -n ' -- '$(git config --global --get user.name) $(date +\%D)")<return>
    " Map Paste / No Number for copy, paste, etc. in Vim without X.
    nnoremap <Leader>p :set paste nonumber<return>
    nnoremap <Leader>np :set nopaste number<return>
    " X System Clipboard copy, cut, & paste shortcuts.
    noremap <Leader>xp "+gP<return>
    noremap <Leader>xy "+y<return>
    noremap <Leader>xx "+x<return>
    " Compile (make) less to new CSS file
    nnoremap <Leader>ml :w <BAR> !lessc % > %:t:r.css<CR><space>
    " Spell Checking
    nnoremap <Leader>sp :setlocal spell spelllang=en_us<return>
    nnoremap <Leader>nsp :setlocal spell spelllang=<return>
    " Write and Write & Quit shortcuts
    nnoremap <Leader>s :w<return>
    nnoremap <Leader>q :wq<return>
    " Start vertical split command with space character.
    nnoremap <Leader>v :vsp<space>
    " Start horizontal split command with space character.
    nnoremap <Leader>h :sp<space>
    " Close window
    nnoremap <Leader>cw :close<return>
    " Close buffer
    nnoremap <Leader>bd :bd<return>
    " Clear highlighting
    nnoremap <Leader>ch :noh<return>
    " Retab entire file
    nnoremap <Leader>rt gg=G
    " Insert a line above or below cursor without insert mode.
    nnoremap <Leader>O O<Esc>
    nnoremap <Leader>o o<Esc>
    " Make arrow keys jump by 10 lines
    nnoremap <S-Down> 10j
    nnoremap <S-Up> 10k
    imap <S-Down> <Esc>10ji
    imap <S-Up> <Esc>10ki
    vmap <S-Down> 10j
    vmap <S-Up> 10k
    " Send the selected hunk to IWS's hastebin
    vmap <Leader>hb <esc>:'<,'>:w !HASTE_SERVER=http://hastebin.britecorepro.com haste<CR>
    " Jump easily between open windows
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    " Refresh syntax highlighting
    nnoremap <Leader>rf :syntax off<return>:syntax on<return>
    " Fix all the whitespace in a file. Re-tabs and removes trailing whitespace.
    " Usage: ,ws
    nnoremap <Leader>ws :TrimWS<return>gg=G
    " Insert a single character of your choosing and return to the right spot.
    " Usage: ,[spacebar][character]
    nnoremap <Leader><space> :exec "normal i".nr2char(getchar())."\e"<return>
    nnoremap <Leader>a :exec "normal a".nr2char(getchar())."\e"<return>
    " Write as super user
    command! W w !sudo tee % > /dev/null
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
    let coffee_make_options='--bare'
    " Auto-compile coffee files on save.
    au BufWritePost *.coffee silent CoffeeMake!
    " Auto-compile less files on save.
    function LessToCss()
        let current_file = shellescape(expand('%:p'))
        let filename = shellescape(expand('%:r'))
        let command = "silent !lessc " . current_file . " " . filename . ".css"
        execute command
    endfunction
    autocmd BufWritePost,FileWritePost *.less call LessToCss()
    let g:syntastic_check_on_open=1 " Run Syntastic when opening files
    let g:syntastic_python_checkers=['python', 'pyflakes'] " Be more strict in python syntax
    let g:pymode_folding=0 " Turn off python-mode folding
    let g:pymode_lint_write=0 " we have two lint plugins...
    let g:pymode_utils_whitespaces=0 " don't molest whitespace
    let g:ftplugin_sql_omni_key='<C-S>' " reset sql omni key
    let NERDSpaceDelims=1 " Add space delimiters
    let g:gitgutter_eager=0 " Only run gitgutter on read/write of files
    nmap gh <Plug>GitGutterNextHunk
    nmap gH <Plug>GitGutterPrevHunk
" }

" Include custom configurations via the .vimrc_custom file
" which is included here:
if filereadable($HOME."/.vimrc_custom")
    source $HOME/.vimrc_custom
endif
