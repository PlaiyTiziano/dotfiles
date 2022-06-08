lua require 'init'

set winwidth=80
set ignorecase
set autowriteall
set smartcase
set noswapfile

syntax enable

let mapleader="\<Space>"
let maplocalleader="\\"

" Reload
map <leader>sop :source %<CR>

" Packer install
map <leader>install :PackerInstall<CR>

" Gitsigns blame
map <leader>blame :Gitsigns toggle_current_line_blame<CR>
map <leader>flame :Gitsigns blame_line<CR>

" Copilot
let g:copilot_enabled = 0

" Splitting windows
nnoremap <S-j> :split<CR>
nnoremap <S-l> :vs<CR>

" Tab Shortcuts
nnoremap tk :tabfirst<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tj :tablast<CR>
nnoremap tnew :tabnew<CR>
nnoremap td :tabclose<CR>

" Toggle folds.
nnoremap <Tab> za

" Make split navigation easier.
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Toggle NvimTree.
map <leader>n :NvimTreeToggle<CR>

let g:UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <expr> <C-p> ':Telescope find_files'."\<cr>"

vmap r "_dP
