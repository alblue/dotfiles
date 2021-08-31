" Vim dotfile
" ---
" Copyright (c) 2021 Alex Blewitt
"
" Released under the MIT License SPDX:MIT
" See LICENSE.txt for more information
" ---
" Defines standard vim settings usable on many machines

" Enable embedded code formatting in markdown files
let g:markdown_fenced_languages = [
\  'bash',
\  'c',
\  'cs',
\  'cpp',
\  'css',
\  'html',
\  'go',
\  'java',
\  'javascript',
\  'objc',
\  'proto',
\  'python',
\  'rust',
\  'sh',
\  'swift',
\  'xml',
\  'xslt',
\  'zsh',
\ ]

" Autocmd are run when switching between different buffers, and also
" used to highlight misspelled words or additional whitespace

" Match trailing whitespace when entering a buffer
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" And clear it again afterwards
autocmd BufWinLeave * call clearmatches()

" Specific actions for file types
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd QuickFixCmdPost *grep* cwindow

" Color flagging for exra whitespace and misspelled files
highlight ExtraWhitespace ctermbg=red guibg=red
highlight SpellBad ctermfg=red ctermbg=none cterm=underline,bold gui=undercurl
match ExtraWhitespace /\s\+$/

if has('filetype')
  filetype plugin on
endif

" When pasting, avoid problems in text
inoremap [200~ <nop>
inoremap [201~ <nop>
set paste

" Use kj instead of <esc>
inoremap kj <esc>

" Use <space> as the leader
let mapleader=" "

" ---
" Local leader commands
" ---

" Toggle line numbers on with <Space>N
nnoremap <Leader>N :setlocal number!<Return>

" Quit (without confirmation)
nnoremap <Leader>Q :q!<Return>
nnoremap <Leader>q :q!

" Switch to other buffer or tab complete
nnoremap <Leader>b :buffer<Space>

" Go back to previous selection (using gv)
nnoremap <Leader>v gv

" Write files without confirmation
nnoremap <Leader>w :wq!<Return>
" Allow w!! to write the file as root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Accept default spelling suggestion
nnoremap <Leader>z 1z=

" Remove highlighted search with space/return
nnoremap <Silent> <Return> :nohlsearch<Return><Return>

" Move between tabs
nnoremap <c-Left> :tabprevious<Return>
nnoremap <c-Right> :tabnext<Return>

" Move between splits"
nnoremap <c-]> g<c-]>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Go to previous search match, put line in middle
nnoremap N Nzz
" Go to next search match, put line in middle
nnoremap n nzz

" Map Y to y$ to follow D and C
map Y y$

" ---
" Settings
" ---

" Enable smart indentation
set autoindent smartindent
" Enable autoread commands
set autoread
" Yank copies to default system clipboard
set clipboard=unnamed
" Use utf-8 for the default encoding
set encoding=utf-8
" Allow all file formats but prefer unix
set fileformats=unix,dos,mac
" By default fold to level 2
set foldlevelstart=2
" Fold based on syntax
set foldmethod=syntax
" Allow hidden buffers
set hidden
" Highlight search results
set hlsearch
" Use incremental search
set incsearch
" Always (2) show the status line
set laststatus=2
" Display → for tabs,· for non breaking space and trailing spaces
set list listchars=tab:→\ ,trail:·,nbsp:·
" Use magic regular expressions
set magic
" Enable the mouse for all modes, if it exists
if has('mouse')
  set mouse=a
endif
" Disable compatibility mode
set nocompatible
" Do not expand tabs
set noexpandtab
set nomodeline
" Don't jump to the first character of a line
set nostartofline
" Use at as a shortmessage format
set shortmess=at
" When searching, if lower case match any case, otherwise exact match
set smartcase
" Automatically indent as appropriate
set smarttab
" Set status line details
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" Enable bracketed paste mode
set t_BE=
" Use four spaces for tabs by default
set tabstop=4 shiftwidth=4
" Enable undo directory/files
set undofile undodir=~/.vim/undodir
" Allow wildcard matching for commands at : ex command line
set wildmenu

" Enable syntax automatically
if has('syntax')
  silent! syntax enable
endif

