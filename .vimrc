if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()


set showcmd " visual feedback of keystrokes
set notimeout " no time limit on leader key combos
let mapleader=","
map <leader><leader> <esc>
map! <leader><leader> <esc>

" Save
map <leader>w :w<cr>
map! <leader>w <esc>:w<cr>

" Save and quit
map <leader>W :wq<cr>
map! <leader>W <esc>:wq<cr>

" Quit
map <leader>q :q<cr>
map! <leader>q <esc>:q<cr>

" Force quit all
map <leader>Q :qa!<cr>
map! <leader>Q <esc>:qa!<cr>

map <C-n> :NERDTreeToggle<cr>
imap <leader>m <plug>(emmet-expand-abbr)

map j gj
map k gk

colorscheme gruvbox
set background=dark

set noexpandtab " use tab for indentation
set shiftwidth=0 " make >> follow tabstop
set tabstop=4 " set width of a tab character
set cursorline " highlight current line
set relativenumber " show line numbers (relative)
set backspace=2 " make backspace work like most other programs
set mouse=a " Allow navigation with the mouse

