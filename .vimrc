"highlight current line
set cursorline
set clipboard=unnamed
set nowrap
set laststatus=2
set hidden
set nu
set scrolloff=5
set wildmenu
set wildmode=longest:full,full
set wildchar=<Tab> wildmenu wildmode=full
syntax enable

" Update highlighting rules
set list
"visible tabs
set listchars=tab:o-,extends:>,precedes:<
hi SpecialKey guifg=grey ctermfg=DarkGrey

" Actionscript syntax highlighting
au BufNewFile,BufRead *.as setlocal ft=actionscript

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" hack i made up to show spaces
hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey
autocmd BufRead * syn match LeadingSpace / / containedin=ALL conceal cchar=·
autocmd BufRead * setl conceallevel=2 concealcursor=nv

hi lineNr       ctermfg=yellow        ctermbg=none       cterm=none
hi CursorLine cterm=NONE ctermbg=Black
hi CursorLineNR ctermfg=yellow        ctermbg=none       cterm=bold
hi statement    ctermfg=yellow        ctermbg=none       cterm=none

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ \ \ Line:\ %l/%L:%c\ (%p%%)

nnoremap <Leader>c :set cursorline! <CR>

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

set expandtab       " use spaces instead of tabs
" set autoindent      " autoindent based on line above, works most of the time
" set smartindent     " smarter indent for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces
set tabstop=2   " in insert mode, tabs are 2 spaces
set scroll=5

"enable ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
