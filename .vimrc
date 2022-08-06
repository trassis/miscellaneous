" OPTIONS
" Displays relative line numbers 
set relativenumber
set nu
" Words are not higlighted after the end of a search
set nohlsearch
" Guarda o ultimo buffer utilizado na memoria
set hidden
" Disables vim from beeping for error massages
set noerrorbells
" Tab and indetention options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" No wrap when code goes over the end of the screen
set nowrap
" Search options and case sensitivity
set ignorecase
set smartcase
" Bakcup and swapfile options
set noswapfile
set nobackup
set undodir=~/.vim/undodir
" Highlight as the searching ocurrs
set incsearch
set showmatch
set termguicolors
" Scrools when n lines away from the bottom or top
set scrolloff=8
" Sets the command history (default is 20)
set history=1000

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
call plug#end()

" APPEARANCE
colorscheme gruvbox

" MAPPINGS
:imap jj <esc>

" STATUS LINE: colors, functions and line
" Color defintion for the status line
hi User1 guifg=#1d2021 guibg=#eb7a31
hi User2 guifg=#1d2021 guibg=#7c6f64 
hi User3 guifg=#d5c4a1 guibg=#504945 
" Returns the current mode - to be displayed on the status line
func! CurrentMode() abort
    let md = mode()
    if md == 'n'
        return 'NORMAL'
    elseif md == 'v'
        return 'VISUAL'
    elseif md == 'i'
        return 'INSERT'
    elseif md == 'c'
        return 'CMD'
    else " check mode() help to define other modes here
        return 'OTHER'
    endif    
endfunc    
" Status line configuration
set laststatus=2
set statusline=
set statusline+=%1*\ \%{CurrentMode()}\ \  "Show current mode
set statusline+=%2*\ %<%F\ %=\        "File path. (%=) is the spacing
set statusline+=%3*\ %y\ \\|\           "File type 
    set statusline+=%3*\row:%l/%L\ \\|\ "Row number 
set statusline+=%3*\col:%c\             "Colum number 
set statusline+=%1*\ %m%r%w\            "Modified, readonly
