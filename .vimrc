" plugin manager
 execute pathogen#infect()

set clipboard=unnamed
set cursorline
set nowrap
set laststatus=2
set nu
set relativenumber
set scroll=5
set scrolloff=5
set lazyredraw
set path+=**
set wildmenu
set wildmode=longest:list,full
"set wildchar=<Tab> wildmenu wildmode=full
syntax enable

" Consolidate swp files
set directory=~/.vim/swap//

" Actionscript syntax highlighting
au BufNewFile,BufRead *.as setlocal ft=actionscript

"overwrite some highlighting rules
hi lineNr       ctermfg=DarkGrey        ctermbg=none       cterm=none
hi CursorLine cterm=NONE ctermbg=Black
hi CursorLineNR ctermfg=yellow        ctermbg=none       cterm=bold
hi statement    ctermfg=yellow        ctermbg=none       cterm=none

" make debug statements more visible
highlight DebugGroup ctermfg=black ctermbg=green
autocmd BufRead * match DebugGroup /debugger\|binding.pry\|console.log/

" Crazy Status Line
hi StatusLine ctermbg=none ctermfg=DarkGrey
hi User1 ctermfg=LightGrey  ctermbg=DarkGrey
hi User2 ctermfg=LightBlue  ctermbg=DarkGrey
hi User3 ctermfg=DarkGrey  ctermbg=DarkBlue
hi User4 ctermfg=DarkGrey  ctermbg=DarkGreen
set statusline=
set statusline+=%3*%{HasPaste()}
set statusline+=\ %F%m%r%h
set statusline+=\ %1*\ Ln:%2*\%l/%L\ %1*Ch:%2*%c
set statusline+=%=
set statusline+=%4*\ Bf:\ %n



" fastmode: toggle off cursorline and relativenu
nnoremap <Leader>f :set cursorline! \| :set relativenumber! <CR>

" Helper Function for determining if we are in 'PASTE MODE'
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

set expandtab       " use spaces instead of tabs
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces
set tabstop=2   " in insert mode, tabs are 2 spaces
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
filetype plugin indent on

" CTRLP STUFF
" set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0
" keep CtrlP cache
" let g:ctrlp_clear_cache_on_exit = 0
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_lazy_update = 150

set wildignore+=*/tmp/*
set wildignore+=*/es6editor/*
set wildignore+=*/node_modules/*

" colorscheme farout

au BufRead,BufNewFile *.p8 set filetype=pico8

" :vsp border
hi VertSplit ctermbg=DarkGrey ctermfg=DarkGrey

" show leading spaces
hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey
autocmd BufRead * setlocal conceallevel=2 concealcursor=nv
autocmd BufRead * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·

" show tabs and trailing spaces
set list
set listchars=tab:├─,extends:>,precedes:<,trail:৸
hi SpecialKey guifg=grey ctermfg=DarkGrey

" include do/end matching for ruby
runtime macros/matchit.vim


" till _
map _ t_

