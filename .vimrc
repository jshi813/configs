" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required

execute pathogen#infect()
syntax on
filetype plugin indent on
set number relativenumber
set cursorline
syntax enable

noremap k gk
noremap j gj

set autoindent smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set backspace=2

" search
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

set runtimepath^=~/.vim/bundle/ctrlp.vim

colorscheme monokai

"""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""
let mapleader=","
let localmapleader=","

vnoremap . :normal .<CR>
vnoremap @ :normal! @

" Toggles
set pastetoggle=<F1>
" the nmap is just for quicker powerline feedback
nmap <silent> <F1>      :set invpaste<CR>
nmap          <F2>      :setlocal spell!<CR>
imap          <F2> <C-o>:setlocal spell!<CR>

map <Leader>/ :nohlsearch<cr>
" Global search and replace by default
set gdefault

map <Home> :tprev<CR>
map <End>  :tnext<CR>

" TODO Do also cnext and cprev as a fallback
map <PageDown> :lnext<CR>
map <PageUp>   :lprev<CR>

" Make Y consistent with D and C
function! YRRunAfterMaps()
  nnoremap <silent> Y :<C-U>YRYankCount 'y$'<CR>
endfunction
" Disable K for manpages - not used often and easy to accidentally hit
noremap K k

" Movement across splits
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" Resize window splits
nnoremap <Up>    3<C-w>-
nnoremap <Down>  3<C-w>+
nnoremap <Left>  3<C-w><
nnoremap <Right> 3<C-w>>

nnoremap _ :split<cr>
nnoremap \| :vsplit<cr>

nnoremap <C-w>s :echo "Use _"<CR>
nnoremap <C-w>v :echo "Use \|"<CR>

vmap s :!sort<CR>
vmap u :!sort -u<CR>

" shift+k -> like shift+j, but no extra space
noremap <S-k> gJ

" Write file when you forget to use sudo
cmap w!! w !sudo tee % >/dev/null
nnoremap <Leader>b :CtrlPBuffer<cr>
nnoremap <C-u> :GundoToggle<CR>

" TODO Merge the NERDTreeFind with Toggle inteilligently.
nnoremap <C-g> :NERDTreeToggle<cr>

let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
                   \ '\.so$', '\.egg$', '^\.git$', '\.cmi', '\.cmo' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1

let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsListSnippets = '<c-h>'

nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <Leader>gg :Ggrep <cword> *<CR>

nnoremap <Leader>a :Ack

" Put a space around comment markers
let g:NERDSpaceDelims = 1

nnoremap <C-y> :YRShow<cr>
let g:yankring_history_dir = '$HOME/.vim'
let g:yankring_manual_clipboard_check = 0

map <Leader>l :MiniBufExplorer<cr>
let g:miniBufExplorerMoreThanOne = 10000
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplSplitBelow=1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplVSplit = 20

let g:airline#extensions#tabline#enabled = 1

let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['c', 'scss', 'html', 'scala'] }

let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']

" From https://github.com/tpope/vim-fugitive/blob/master/README.markdown:
" automatically open quickfix window after :Ggrep
autocmd QuickFixCmdPost *grep* cwindow

set laststatus=2
let g:airline_powerline_fonts = 1

let g:ctrlp_map = '<Leader>.'
map <Leader>, :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = '/\.\|\.o\|\.so'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_regexp = 1
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
let g:ctrlp_map = '<c-p>'

noremap \= :Tabularize /=<CR>
noremap \: :Tabularize /^[^:]*:\zs/l0l1<CR>
noremap \> :Tabularize /=><CR>
noremap \, :Tabularize /,\zs/l0l1<CR>
noremap \{ :Tabularize /{<CR>
noremap \\| :Tabularize /\|<CR>

nnoremap <Leader>t :TagbarOpen fjc<CR>

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0

map <C-\> :ScreenShellVertical<CR>

"" Rainbow config
let g:rainbow_conf = { 'ctermfgs': ['red', 'yellow', 'green', 'cyan', 'magenta', 'red', 'yellow', 'green', 'cyan', 'magenta'] }
let g:rainbow_matching_filetypes = ['lisp', 'scheme', 'clojure', 'javascript', 'html']

function s:load()
  if count(g:rainbow_matching_filetypes, &ft) > 0
    call rainbow#hook()
  endif
endfunction

augroup rainbow
  autocmd!
  autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * nested call s:load()
augroup END

" quiting and saving
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>
