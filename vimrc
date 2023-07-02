syntax on
" Vundle Start
set nocompatible              " be iMproved, required
filetype off                  " required
filetype indent plugin on

set rtp+=/opt/homebrew/opt/fzf
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'gabrielelana/vim-markdown'
Plugin 'morhetz/gruvbox'
Bundle 'chase/vim-ansible-yaml'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Vundle End

set list
set listchars=tab:>-
" set extra trailing white space as highlighted in red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+$/


au VimEnter * if &diff | execute 'windo set wrap' | endif

" Make vim indent 2 spaces for ruby and scala files only
filetype plugin indent on
set sw=4
set ts=4
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab

set textwidth=140 " This wraps a line with a break when you reach 140 chars

autocmd Filetype ruby set softtabstop=2
autocmd Filetype ruby set sw=2
autocmd Filetype ruby set ts=2
" cloudformation format
autocmd BufWritePost *.template silent !cfn-format -w % 2>/dev/null
" autocmd BufWritePost *.template.yml silent !cfn-format -w % 2>/dev/null
