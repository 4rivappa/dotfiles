set nu
set relativenumber 
set guicursor= 
set hidden 
set tabstop=4 softtabstop=4
set shiftwidth=4 
set nowrap
set incsearch
set nohlsearch
set scrolloff=8
set guifont=Consolas:h14
" set guifont = FiraCode:h14
" set bg=dark
set splitright
set mouse=a
set autochdir
set termguicolors

filetype plugin on

call plug#begin('~/.vim/plugged') 
Plug 'gruvbox-community/gruvbox' 
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'arcticicestudio/nord-vim'
Plug 'dylanaraps/wal.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-fugitive' 

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
call plug#end() 
 
" g:gruvbox_contrast_dark = 'hard'
" g:gruvbox_contrast = 'hard'
set bg=dark

" gruvbox settings
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = 1
colorscheme gruvbox 

"let g:tokyonight_style = "night"
"colorscheme tokyonight

"colorscheme nord
"colorscheme wal

let mapleader=" " 

nnoremap <leader>c gg"+yG
nnoremap <leader>nf :e %:h/
"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR> 
"autocmd filetype cpp nnoremap <F10> :!%:r<CR>
"autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++14 -O2 -Wall % -o %:r && %:r.exe<CR>
autocmd filetype cpp nnoremap <F6> :vsplit term://(g++ -std=c++14 -O2 -Wall % -o %:r && %:r.exe)<CR>
autocmd filetype cpp nnoremap <F9> :vsplit term://(g++ -std=c++14 -O2 -Wall % -o main && main.exe)<CR>
autocmd filetype python nnoremap <F9> :vsplit term://(python %)<CR>
"autocmd filetype cpp nnoremap <F7> :term g++ -std=c++14 -O2 -Wall % -o %:r && %:r.exe<CR>
"autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++'.shellescape('%').'-o'.shellescape('%:r').'&& ./'.shellescape('%:r')<CR>

"telescope mappings
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"-------------------------coc---------
function! s:check_back_space() abort 
    let col=col('.') - 1 
    return !col || getline('.')[col - 1] =~# '\s' 
endfunction
fun! GoCoc() 
	    inoremap <buffer> <silent><expr <>TAB> 
		            \ pumvisible( ? )\"C-n>< : 
		            \<"SID>check_back_space( ? )\<"TAB>" :
		            \coc#refresh() 

	    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p> : ""\<C-h>" 
	    inoremap <buffer> <silent>expr>< <C-space> coc#refresh()  
		
		" GoTo code navigation 
		nmap <buffer> <leader>gd <Plug>(coc-definition) 
		nmap <buffer> <leader>gy <Plug>(coc-type-definition) 
		nmap <buffer> <leader>gr <Plug>(coc-references) 
		nnoremap <buffer> <leader>cr :CocRestart 
endfun 
"---------------------------------------- 

nmap <leader>gs :G<CR> 
nmap <leader>gh :diffget //3<CR> 
nmap <leader>gu :diffget //2<CR> 
" :Gcommit for commiting staged 
" :Gpush for pushing branches 
"----------------------------------------

" NerdTree mappings
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>
nnoremap <leader>nn :NERDTreeFocus<CR>
