" set nocompatible
"filetype on 
filetype indent on
filetype plugin on
filetype plugin indent on

" Pretty Colors
 if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
   let &t_8f = "[38;2;%lu;%lu;%lum"
   let &t_8b = "[48;2;%lu;%lu;%lum"
 endif
set termguicolors

" Italics
" set t_ZH=[3m
" set t_ZR=[23m
" set t_Co=256

" Fuzzy File Completion
set rtp+=~/.fzf

" Mouse Scrolling
set mouse=n

" Keyboard Shortcuts
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-}> :buf next
map <C-{> :buf previous
map <C-p> :FZF <CR>

" Comma Leader Key
let mapleader = ","

" FZF include recent files in ⌘P
nmap <silent> <leader>m :History<CR>
nmap <silent> <leader>0 :NERDTreeToggleVCS<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>
nmap <silent> <leader>b :Buffers<CR>
nmap <silent> <leader>y :<,'>:w !it2copy<CR>
" FastFold
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" Fuck folding (slowdown hog)
set nofoldenable
set redrawtime=10000
" let g:markdown_folding = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:zsh_fold_enable = 1
" let g:php_folding = 1

" No fix for eol
set nofixeol

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'neoclide/coc.nvim'
"Plug 'konfekt/FastFold'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
"Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'mattn/emmet-vim'
"Plug 'pangloss/vim-javascript'
call plug#end()

packadd! dracula_pro
"syntax on 
set re=0
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

" NERDTree Folder/Directory Icons
"let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
"let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches['Model'] = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" ctags
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
