" set nocompatible
filetype on 
filetype indent on
filetype plugin on
filetype plugin indent on

" Pretty Colors
let &t_8f = "[38;2;%lu;%lu;%lum"
let &t_8b = "[48;2;%lu;%lu;%lum"
set termguicolors

" Italics
set t_ZH=[3m
set t_ZR=[23m
set t_Co=256

" Fuzzy File Completion
set rtp+=~/.fzf

" Mouse Scrolling
set mouse=n

" Keyboard Shortcuts
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Comma Leader Key
let mapleader = ","

" FZF include recent files in ⌘P
nmap <silent> <leader>m :History<CR>
nmap <silent> <leader>0 :NERDTreeToggleVCS<CR>
nmap <silent> <leader>b :Buffers<CR>

" No fix for eol
set nofixeol

" Phpactor
"let g:phpactorPhpBin = "/usr/bin/php7.4"

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim'
Plug 'neovim/nvim-lspconfig'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
"Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
"Plug 'phpactor/ncm2-phpactor'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
"Plug 'StanAngeloff/php.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
" Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" ncm2
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect

"packadd YouCompleteMe
"packadd ncm2
"packadd phpcomplete.vim
"packadd fzf.vim
packadd! dracula_pro
"packadd vim-airline
"packadd vim-gitgutter
"packadd vim-airline-themes
syntax enable
" fix syntax highlighting
autocmd BufEnter * syntax sync fromstart
let g:dracula_colorterm = 1
let g:airline_theme='dracula_pro'
let g:dracula_italic = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme dracula_pro_van_helsing
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nu
noremap ; :

" Syntax Highlight HTML inside PHP
let php_htmlInStrings = 1

" Java Abbreviation
"abbr psvm public static void main(String[] args){<CR>}<esc>O
"abbr sout System.out.println("");<esc>2hi
"abbr syserr System.err.println("");<esc>2hi
"abbr forl for (int i = 0; i < ; i++) {<esc>7hi
"abbr tryb try {<CR>} catch (Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3ko
"abbr ctm System.currentTimeMillis()

" Proper Encoding
set encoding=utf-8

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = ''
let g:airline#extensions#tabline#buffer_nr_show = 1

" 256 colors
"set term=xterm-256color

" vim file exploration
let g:netrw_liststyle = 3
set title

" tmux vim title in tab
augroup tmux
	autocmd!
	if exists('$TMUX')
	autocmd BufReadPost,FileReadPost,BufNewFile,FocusGained * call system("tmux rename-window " . expand("%:t"))
	autocmd VimLeave,FocusLost * call system("tmux set-window-option automatic-rename")
	endif
augroup END

" ctags
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
