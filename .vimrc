syntax on
filetype on
filetype plugin on


set background=dark
set backspace=eol,indent,start
" set cursorline
set encoding=utf-8
set grepprg=/usr/lib/git-core/git-grep
set hidden
set incsearch
set laststatus=2
set mouse=a
set nobackup
set nocompatible
set nohls
set notitle
set nowrap
set showmatch
set showcmd
set showmode
set smartcase
set ttyfast
" set visualbell
set wildmenu
set wildmode=list:longest
set number
" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h%=\ \ \ Line:\ %l/%L:%c\ (%p%%)
colorscheme default

" Helper Function for getting the current directory
function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "g")
  return curdir
endfunction

" Helper Function for determining if we are in 'PASTE MODE'
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

" Update highlighting rules
set list
set listchars=tab:o-,extends:>,precedes:<
hi SpecialKey guifg=grey ctermfg=DarkGrey

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey
autocmd BufRead * syn match LeadingSpace / / containedin=ALL conceal cchar=·
autocmd BufRead * setl conceallevel=2 concealcursor=nv

" The following two options will save the fold-state
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

" Turn on auto indenting
set expandtab       " use spaces instead of tabs
" set autoindent      " autoindent based on line above, works most of the time
" set smartindent     " smarter indent for C-like languages
set shiftwidth=2    " when reading, tabs are 4 spaces
set softtabstop=2   " in insert mode, tabs are 4 spaces
set tabstop=2   " in insert mode, tabs are 4 spaces


" turn on folding
 set foldenable

" define auto folding rule
set foldmethod=syntax

" show a column indicating where folds are
set foldcolumn=2

" initial fold level
set foldlevelstart=99

" enable file type specific folding
autocmd BufRead,BufNewFile *.js let javaScript_fold=1
autocmd BufRead,BufNewFile *.rb let ruby_fold=1

map <S-Enter> O<Esc>
map <CR> o<Esc>
map ; :CtrlPBuffer<CR>

" use space to open folds in normal mode
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" always show at least 5 lines above and below current line
set scrolloff=5

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default

" map <leader>q and <leader>w to buffer prev/next buffer
nnoremap q <NOP>
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim
" filetype indent off

