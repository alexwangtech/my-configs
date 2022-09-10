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
"

call plug#begin()

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Here's some more stuff I found from the nvim-lspconfig GitHub page.
lua << EOF
-- Mappings.
-- See :help vim.diagnostic.* for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See :help vim.lsp.* for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require("nvim-lsp-installer").setup{
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}
require('lspconfig').jdtls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').metals.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
EOF

" nnoremap <silent> <C-p> :FZF<CR>
" nnoremap <silent> <C-n> :Rg<CR>
