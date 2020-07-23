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
let mapleader=","
noremap <leader><leader> <esc>
noremap! <leader><leader> <esc>

" Save
noremap <leader>w :w<cr>
noremap! <leader>w <esc>:w<cr>

" Save and quit
noremap <leader>W :wq<cr>
noremap! <leader>W <esc>:wq<cr>

" Quit
noremap <leader>q :q<cr>
noremap! <leader>q <esc>:q<cr>

" Force quit all
noremap <leader>Q :qa!<cr>
noremap! <leader>Q <esc>:qa!<cr>

" Select all
noremap <leader>a ggVG

" Quick macro execution with Q
noremap Q @q

noremap <C-n> :NERDTreeToggle<cr>
imap <leader>m <plug>(emmet-expand-abbr)

noremap j gj
noremap k gk

colorscheme gruvbox
set background=dark

set noexpandtab " use tab for indentation
set shiftwidth=0 " make >> follow tabstop
set tabstop=4 " set width of a tab character
set cursorline " highlight current line
set relativenumber " show line numbers (relative)
set backspace=2 " make backspace work like most other programs
set mouse=a " Allow navigation with the mouse

