" yank file name/path of current buffer
noremap <silent> <F4> :let@+=expand("%:p")<CR>

" highlighting that stays after cursor moves
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

nore ; :

" this is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" highlight text after 80 columns
if exists('+colorcolumn')
" only as of Vim 7.3
  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set cursorline

":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

" use vim improvements
set nocompatible

" turn syntax coloring on
syntax on

" save backups to ~/.vim/backup
set backupdir=~/.vim/backup,.,/tmp
set directory=.,~/.vim/backup,/tmp

" save swap files to ~/.vim/swp
"set directory=~/.vim/swp//

" set the template style
colorscheme dank-neon

"highlight OverLength guibg=#d75f5f
"match OverLength /\%81v.\+/

" Show trailing whitespace:
:highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" set the font
set gfn=Monospace\ 12

" highlight search results
set hlsearch

" use incremental searching
set incsearch

" show line numbers
"set number

" set tabbing
set tabstop=8
"=4
set shiftwidth=8
"=4

" auto expand tabs to spaces
" Remove this when working with makefiles
"autocmd FileType make setlocal noexpandtab
set expandtab

" auto indent after a {
"set autoindent
"set smartindent

" set linewidth to endless
set textwidth=0

" do not wrap lines automatically
set nowrap

" do case-insensitive searches
set ignorecase
set smartcase

" always show command or insert mode
set showmode

" show line and column information
set ruler

" show matching brackets
set showmatch

" wrap to previous/next line when hitting the specified keys
set whichwrap+=<,>,h,l,[,]

" show how many lines between matching pairs
set showcmd

" make backspace work
"set backspace=2
set backspace=indent,eol,start

" remove GUI options
set guioptions-=T

" wildmenu for switching between buffers
set wildmenu
set wildmode=list:longest,full

" switch from an unsaved buffer without saving it first and keep an undo history for multiple files
set hidden

"highlight Cursor guifg=white guibg=steelblue
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

" stop cursor from blinking
set guicursor=a:blinkon0

" help gvim load faster by preventing the X display to open
set clipboard=exclude:.*

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Enable copy 1000 lines
set viminfo='100,<1000,s100,h

if &diff
  colorscheme evening
endif
