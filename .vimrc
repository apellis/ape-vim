set clipboard=unnamedplus
set mouse=c
set number
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'kien/ctrlp.vim'
Plugin 'aaronbieber/quicktask'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'The-NERD-Commenter'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'bkad/CamelCaseMotion'
Plugin 'wincent/command-t'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-arline/vim-airline-themes'
Bundle 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

colorscheme badwolf         " awesome colorscheme
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohl<CR>

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on indent level

" highlight last inserted text
nnoremap gV `[v`]

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

let mapleader=","       " leader is comma

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal expandtab
    autocmd FileType cpp setlocal tabstop=2
    autocmd FileType cpp setlocal shiftwidth=2
    autocmd FileType cpp expandtab
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" strips trailing whitespace at the end of files. this
" " is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" Allow w!! if forgot to sudo
cmap w!! w !sudo tee % >/dev/null

:imap jk <Esc>

" custom tab behavior
:nmap <leader>[ :tabprevious<CR>
:nmap <leader>] :tabnext<CR>
:map <leader>[ :tabprevious<CR>
:map <leader>] :tabnext<CR>
:imap <leader>[ <Esc>:tabprevious<CR>i
:imap <leader>] <Esc>:tabnext<CR>i
" :nmap <leader>t :tabe<space>
" :imap <leader>t <Esc>:tabe<space>

" more intuitive new split behavior
set splitbelow
set splitright

" command-T
" change this on other machines!
let g:CommandTTraverseSCM = '/Users/aellis/Documents/Code

" airline
set laststatus=2

set wildmode=longest,list,full
set wildmenu

" tab completion for python
set omnifunc=jedi#completions
