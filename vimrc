"Pathogen"
call pathogen#infect()

"Basic settings"
set nocompatible "Apparently this is a good idea."
syntax on "Syntax Highlighting"
set history=300 "300 lines of history"
set backspace=indent,eol,start "Backspace over autoindent, line breaks, and the start of insert"
set ruler "Show the ruler"
set virtualedit=onemore "Allows cursor placement over the line's end in normal mode"
set pastetoggle=<F2> "F2 enters paste mode in Insert mode"
set clipboard=unnamed "OS-level clipboard integration for yank and put"
set number "Show line numbers"
filetype plugin indent on "Automatic indentation based on filetype"
let &t_Co=256 "256 colors in the terminal"
set cursorline "Highlight the current line"
set mouse=a "Mouse support"
Helptags
set hidden "Allow switching from unsaved buffers"
set confirm "Confirmation dialog instead of fail on unwritten buffers"
set splitbelow "split under insteaad of over"
set splitright "vsplit to the right instead of the left"
set scrolloff=3 "Mininum number of lines to keep above or below the cursor"
set showcmd "shows partial commands and visual selection dimensions"

"Objective-C Alternate"
autocmd FileType objc let g:alternateExtensions_h = "m"
autocmd FileType objc let g:alternateExtensions_m = "h"

"Don't split words on line breaks"
set formatoptions=l
set lbr

"Search"
set hlsearch "Highlights search results"
set ignorecase "Case-insensitive search"
set smartcase "If a search contains an uppercase character, it is case-sensitive"
set incsearch "Incremental search: search as you type"

"Remaps"

"Make Y behave like other capitals"
nnoremap Y y$

"Better split movement"
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
inoremap <c-h> <Esc><c-w>h
inoremap <c-l> <Esc><c-w>l
inoremap <c-j> <Esc><c-w>j
inoremap <c-k> <Esc><c-w>k

"Better wrapped line navigation"
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
vnoremap <down> gj
vnoremap <up> gk

"Indentation - please ignore how terrible this may be"
set autoindent
set cindent
set copyindent "copy the previous indentation on enter
set smartindent "conflicts with filetype plugin indent on"
set smarttab "Tab key does indents"
"set tabstop=4
set shiftwidth=2
set expandtab

"Tab always indents"
nnoremap <Tab> >>
inoremap <Tab> <Esc>>>i
vnoremap <Tab> >gv
vnoremap > >gv
vnoremap = =gv
"gv reselects the previous selection"

"Shift-tab reverse-indenting"
nnoremap <S-Tab> <<
inoremap <S-Tab> <Esc><<i
vnoremap <S-Tab> <gv
vnoremap < <gv
"gv reselects the previous selection"

"Delete key no longer deletes in normal mode"
nnoremap <del> <right>

" NERDTree
nnoremap <space><space> :NERDTreeToggle<cr>
nnoremap <space>f :NERDTreeFind<cr>

"Color scheme"
let g:molokai_original = 1
colorscheme molokai

"Fix vim slowness in tmux"
set notimeout
set ttimeout
set timeoutlen=50

"Status settings"
set laststatus=2 "Always show the ruler in all splits"
let g:Powerline_colorscheme = 'default'
let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols_override = {
        \ 'BRANCH': [0x00b1],
        \ }
let g:Powerline_mode_n  = 'N'
let g:Powerline_mode_i  = 'I'
let g:Powerline_mode_R  = 'R'
let g:Powerline_mode_v  = 'V'
let g:Powerline_mode_V  = 'VL'
let g:Powerline_mode_cv = 'VB'
let g:Powerline_mode_s  = 'S'
let g:Powerline_mode_S  = 'SL'
let g:Powerline_mode_cs = 'SB'
let g:Powerline_stl_path_style = 'short'
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')

"Session fuckery
fu! SaveSess()
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
  if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()

set sessionoptions-=options  " Don't save options

"GUI Options"
if has("gui_running")
    set guifont=Inconsolata:h13 "GUI Typeface and font size"

    "Start maximized"
    set fuoptions=maxvert,maxhorz
    set guioptions-=r "Remove the right scrollbar in MacVim"
    set guioptions-=L "Remove the left scrollbar in MacVim"
endif
