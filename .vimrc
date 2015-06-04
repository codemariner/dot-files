:version 5.0

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show the cursor position all the time
set ruler		

" display incomplete commands
set showcmd

set secure exrc
set nobk bs=2 magic report=2
" Below are two values for the 'shell' setting, one for use on Windows,
" the other for UNIX.  Uncomment one and edit if necessary.
" The Windows version
"set shell=C:\cygwin\bin\bash.exe
" The UNIX version
set shell=/bin/bash

set shiftwidth=4 textwidth=74
set softtabstop=4
set autoindent
set expandtab
"set smartindent
set fileformats=unix,mac,dos
set showmatch matchtime=3
set sr su=.o.a.sl.so.swp.vim to ttimeout tildeop
set smarttab incsearch hlsearch

"highlighting search"
set hls
set cino=t0,(0
set laststatus=2
highlight StatusLine term=reverse cterm=reverse
highlight StatusLineNC term=bold,reverse cterm=bold,reverse

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<CR>/<BS>

" Put useful info in status line
":set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

set tags=./.tags,./tags,tags

set dict=/usr/share/dict/words

if has("terminfo")
   set t_Co=16
   set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
   set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
   set t_Co=16
   set t_Sf=[3%dm
   set t_Sb=[4%dm
endif
"set background=light

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  " set guifont=Monaco:h14
  set guifont=Inconsolata-dz:h14
endif
filetype plugin on
filetype indent on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

noremap!  

set path=.,,

"set errorformat=\ %#[exec]\ [checkstyle-errors]:%f:%l:%m
"set errorformat+=[checkstyle-errors]:%f:%l:%m

"set errorformat+=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^
"set errorformat+=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

set makeprg=./build/build.sh

map =m :set ffs=mac:e!:set ffs=unix,mac,dos
map =sp :w:!/usr/bin/aspell --mode=email --lang=en check %

set pastetoggle=<F11>
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
imap <C-E> <Esc>A
imap <C-Space> <Esc>A
imap <C-A> <Esc>I
imap <C-F> <Esc>lWi
imap <C-B> <Esc>Bi
imap <C-J> <Esc>gqapi

au BufNewFile,BufRead *.asc set filetype=javascript
au BufNewFile,BufRead buildfile set filetype=ruby


" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" It's not like :W is bound to anything anyway.
command! W :w

" map custom leader
let mapleader=","

" Find function
map <leader>/f /^ *def\><cr>
" Find class
map <leader>/c /^ *class\><cr>

function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/home/ssayles/src/ua3'
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()
set noexpandtab
set tabstop=4
set shiftwidth=4


call pathogen#infect()
