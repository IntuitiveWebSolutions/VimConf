" Maintainer: Matt Thompson <https://github.com/mathom>
" Version:    1.0
" based on Ben Hayden's vimrc https://github.com/beardedprojamz/DotFiles

" ---------------
" NeoBundle Setup
" ---------------

" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc is needed for async Unite.vim and NeoBundle
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \  } }
" sensible.vim: Sensible Vim Setup everyone can agree on
NeoBundle 'tpope/vim-sensible'
" sleuth.vim: Heuristically set buffer options
NeoBundle 'tpope/vim-sleuth'
" commentary.vim: Comment stuff out
NeoBundle 'tpope/vim-commentary'
" surround.vim: Quoting/parenthesizing made simple
NeoBundle 'tpope/vim-surround'
" repeat.vim: Enable repeating supported plugin maps with "."
NeoBundle 'tpope/vim-repeat'
" abolish.vim: Easily search for, substitute, and abbreviate multiple variants of a word
NeoBundle 'tpope/vim-abolish'
" fugitive.vim: Git wrapper so awesome, it should be illegal
NeoBundle 'tpope/vim-fugitive'
" Next generation completion framework
NeoBundle 'Shougo/neocomplete', {
  \ 'disabled' : !has('lua'),
  \ 'vim_version' : '7.3.885' }
" Add snippet support to Vim
NeoBundle 'Shougo/neosnippet.vim', {
  \ 'depends': 'Shougo/neosnippet-snippets' }
" Unite and create user interfaces
" Unite plugins for file outline, ctags and MRU (most-recently-used)
NeoBundleLazy 'Shougo/unite.vim', {
  \ 'depends' : ['Shougo/unite-outline',
  \              'tsukkee/unite-tag',
  \              'Shougo/neomru.vim'],
  \ 'autoload' : { 'commands' : 'Unite' } }
" plugin that shows a git diff in the gutter (sign column) and stages/reverts hunks.
NeoBundle 'airblade/vim-gitgutter'
" Precision colorscheme for the vim text editor
NeoBundle 'altercation/vim-colors-solarized'
" A colorful, dark color scheme for Vim.
NeoBundle 'nanotech/jellybeans.vim'
" lean & mean status/tabline for vim that's light as air
" NeoBundle 'bling/vim-airline'
" Syntax checking hacks for vim
NeoBundle 'scrooloose/syntastic'
" Mappings that boost vim's command line.
NeoBundle 'bruno-/vim-husk'
" Insert or delete brackets, parens, quotes in pair
NeoBundle 'jiangmiao/auto-pairs'
" VimL Linting with Vint & Syntastic
NeoBundle 'todesking/vint-syntastic'
" Puppet syntax & goodies
NeoBundleLazy 'rodjek/vim-puppet', {
  \ 'autoload' : { 'filetypes' : 'puppet' } }
" Less syntax & goodies
NeoBundleLazy 'groenewege/vim-less', {
  \ 'autoload' : { 'filetypes' : 'less' } }
" Golang syntax & goodies
NeoBundleLazy 'fatih/vim-go', {
  \ 'autoload' : { 'filetypes' : 'go' } }
" Coffeescript syntax & goodies
NeoBundleLazy 'kchmck/vim-coffee-script', {
  \ 'autoload' : { 'filetypes' : 'coffee' } }
" Fish Shell syntax & goodies
NeoBundleLazy 'dag/vim-fish', {
  \ 'autoload' : { 'filetypes' : 'fish' } }
" Salt syntax & goodies
NeoBundleLazy 'saltstack/salt-vim', {
  \ 'autoload' : { 'filetypes' : 'sls' } }
" Cython syntax & goodies
NeoBundleLazy 'tshirtman/vim-cython', {
  \ 'autoload' : { 'filetypes' : 'cython' } }
" Dockerfile syntax & goodies
NeoBundleLazy 'ekalinin/Dockerfile.vim', {
  \ 'autoload' : { 'filetypes' : 'Dockerfile' } }

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" -----------
" UI Settings
" -----------

set background=dark
colorscheme jellybeans

" If you prefer Solarized Dark:
"colorscheme solarized
"set t_Co=16

" Highlight current line
set cursorline
" Highlight searched for phrases
set hlsearch
" Do not redraw while running macros
set lazyredraw
" Turn on line numbers
set number
" We are good up to 99999 lines
set numberwidth=5
" Show matching brackets
set showmatch
" List whitespace characters
set list

" ---------------
" Custom Mappings
" ---------------

let g:mapleader = ','
" Spell Checking
nnoremap <Leader>ep :setlocal spell! spelllang=en_us<CR>
" X System Clipboard copy, cut, & paste shortcuts.
noremap <Leader>xP "+gP<CR>
noremap <Leader>xp "+gp<CR>
noremap <Leader>xy "+y<CR>
noremap <Leader>xx "+x<CR>
" Paste modes
noremap <Leader>p :set paste<CR>
noremap <Leader>np :set nopaste<CR>
" Highlight modes
noremap <Leader>hh :nohl<CR>
" Format JSON automagically
vnoremap <Leader>j <Esc>:'<,'>:!python -m json.tool<CR>
" Start vertical split command with space character.
nnoremap <Leader>v :vsplit<CR>
" Start horizontal split command with space character.
nnoremap <Leader>s :split<CR>
" Start help command with space character.
nnoremap <Leader>he :help<Space>
" Close window
nnoremap <Leader>c :close<CR>
" Close all but the current window.
nnoremap <Leader>0 :only<CR>
" Save the file
nnoremap <Leader>w :write<CR>
" Save all files and quit
nnoremap <Leader>q :wqall<CR>
" Close buffer
nnoremap <Leader>d :bd<CR>
" Insert a line above or below cursor without insert mode.
nnoremap gO O<Esc>
nnoremap go o<Esc>
" Write as super user
command! W w !sudo tee % > /dev/null
" Reset sql omni key - not <C-c>
let g:ftplugin_sql_omni_key='<C-S>'
" Search for visual selection
vnorem // y/<C-R>"<CR>
" Toggle color column at 100 chars - useful for PEP8 compiliance
let g:color_column_old = 100
nnoremap <Leader>] :call fxns#ToggleColorColumn()<CR>
" Add Profiling commands
command! StartProfile call fxns#StartProfile()
command! StopProfile call fxns#StopProfile()
" Vimrc auto command group
augroup vimrc_au
  autocmd!
  " Re-open VIM to the last spot you had open.
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " Jump to the top of git COMMIT_EDITMSG files.
  au BufReadPost COMMIT_EDITMSG exe "normal! gg"
augroup END

" -------------------------
" Unite Settings & Mappings
" -------------------------

let g:unite_data_directory = '~/.vim/tmp/unite'
let g:unite_source_history_yank_enable = 1
" Fuzz that match
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')
" Start in insert mode by default & shrink window size
call unite#custom#profile('default', 'context', {'start_insert' : 1, 'winheight': 10})
" Use ag for file_rec & grep
if executable('ag')
  let g:unite_source_rec_async_command = 'ag --nogroup --nocolor --column -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <Leader>/ :<C-u>Unite -buffer-name=grep grep:.<CR>
nnoremap <Leader>t :<C-u>Unite -buffer-name=files file_rec/async<CR>
nnoremap <Leader>f :<C-u>Unite -buffer-name=files file<CR>
nnoremap <Leader>u :<C-u>Unite -buffer-name=mr file_mru<CR>
nnoremap <Leader>r :<C-u>Unite -buffer-name=tag tag<CR>
nnoremap <Leader>o :<C-u>Unite -buffer-name=outline outline<CR>
nnoremap <Leader>y :<C-u>Unite -buffer-name=yank history/yank<CR>
nnoremap <Leader>l :<C-u>Unite -buffer-name=buffer buffer<CR>
nnoremap <Leader>m :<C-u>UniteResume<CR>
nnoremap <Leader>? :call fxns#UniteGrepCWord()<CR>

" -----------------------------
" Syntastic Settings & Mappings
" -----------------------------

" Run Syntastic on open
let g:syntastic_check_on_open = 1
" Be more strict in python syntax
let g:syntastic_python_checkers = ['python', 'pyflakes']
" Use vint for VimL
let g:syntastic_vim_checkers = ['vint']
" Set up active/passive map
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['go'] }
" Error list, next & previous commands for Syntastic
nnoremap <Leader>el :Errors<CR>
nnoremap <Leader>en :lnext<CR>
nnoremap <Leader>ep :lprev<CR>
" Bring up SyntasticCheck command for explicit checking
nnoremap <Leader>es :SyntasticCheck<Space>


" -----------------
" Fugitive Mappings
" -----------------

noremap <Leader>gb :Gblame<CR>
noremap <Leader>go :Gbrowse<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gd :Gdiff<CR>

" -------------------
" Git Gutter Settings
" -------------------

" Only run gitgutter on read/write of files
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" Disable GitGutter in vimdiff
if &diff
  let g:gitgutter_enabled = 0
endif

" -------------------------------
" Neocomplete Settings & Mappings
" -------------------------------

let g:neocomplete#enable_at_startup = 1
if exists('g:loaded_neocomplete')
  " Turn this thing on.
  let g:neocomplete#data_directory = '~/.vim/tmp/neocomplete'
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3

  " Plugin key-mappings.
  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=fxns#neocompleteCR()<CR>
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y> neocomplete#close_popup()
  inoremap <expr><C-e> neocomplete#cancel_popup()

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  " Python's omni completion is broken
  let g:neocomplete#sources#omni#input_patterns.python = ''
endif

" -------------------------------
" Neosnippets Settings & Mappings
" -------------------------------

let g:neosnippet#data_directory = '~/.vim/tmp/neosnippet'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"" For snippet_complete marker.

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ---------------
" neomru Settings
" ---------------

let g:neomru#file_mru_path = expand('~/.vim/tmp/neomru/file')
let g:neomru#directory_mru_path = expand('~/.vim/tmp/neomru/directory')

" ---------------
" vim-go Settings
" ---------------

let g:go_fmt_command = 'goimports'
let g:go_snippet_engine = 'neosnippet'

" ----------------
" airline Settings
" ----------------

let g:airline_powerline_fonts = 1

" -------------------
" Commentary Mappings
" -------------------

" Comment out & Write file
nmap <Leader>, <Plug>CommentaryLine:noautocmd write<CR>
vmap <Leader>, <Plug>Commentary:noautocmd write<CR>

" -------------
" GVim Settings
" -------------

if has('gui_running')
  if has('macunix')
    set guifont=Source\ Code\ Pro:h16
  elseif has('unix')
    set guifont=Source\ Code\ Pro\ Medium \ 13
  end
  " No Toolbar
  set guioptions-=T
  " No Right-hand Scroll bar
  set guioptions-=r
  " No Left-hand Scroll bar
  set guioptions-=L
endif

" vim:set ft=vim et sw=2:
