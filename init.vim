" Tab and space configurations.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" If there is a local .vimrc in the current directory, automatically source it.
set exrc

" Always have the cursor as a block. May want to have a different cursor when
" in insert mode in the future.
set guicursor=

" Relative number and number configuration.
set relativenumber
set number

" No highlight searching.
set nohlsearch

" Allows buffers to remain in the background without having to be saved.
set hidden

" TODO - Maybe we would like to enable this in the future?
" set noerrorbells

" No wrapping of text when it reaches the end of the screen.
set nowrap

" TODO - Maybe we want these in the future when we use undotree?
" set noswapfile
" set nobackup
" set undodir=~/.vim/undodir
" set undofile

" Incremental searching, highlight while searching.
set incsearch

" TODO - Maybe use this? Adds a bit of buffer as we scroll near the bottom and top.
" set scrolloff=8

" Sets a visual guide. We can make this longer if needed.
set colorcolumn=80

" Creates a gutter for symbols and stuff.
set signcolumn=yes

" TODO - Let's add in vim-plug sometime.
" TODO - telescope.nvim, is it compatible with vim?
" TODO - gruvbox, is it compatible with vim?
" TODO - neovim lsp, is it compatible with vim? Alternative is coc.
" TODO - treesitter, is it compatible with vim? Alternative is coc.
" TODO - undotree, is it compatible with vim? Alternative is coc.
" TODO - fugitive (tpope), is it compatible with vim? Alternative is coc.

" TODO - What is this? Is this for a transparent background?
" :highlight Normal guibg=None

" TODO - As we get into plugins, need to learn about remaps.
" https://www.youtube.com/watch?v=DogKdiRx7ls
