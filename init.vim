call plug#begin("$HOME/.vim/plugged")
" Plugin section
	Plug 'preservim/nerdtree' |
		\ Plug 'Xuyuanp/nerdtree-git-plugin' |
	Plug 'ryanoasis/vim-devicons'
	Plug 'vim-airline/vim-airline'
	Plug 'preservim/tagbar'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'marko-cerovac/material.nvim'
	Plug 'tpope/vim-fugitive'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'cohama/lexima.vim'
	Plug 'mattn/emmet-vim'
call plug#end()

set encoding=UTF-8
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set smarttab				" set smart tabbing
set relativenumber          " set relative line numbers 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set foldmethod=syntax
set nofoldenable

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree

let NERDTreeWinSize=40
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeAutoDeleteBuffer=1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-a> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Quit if NerdTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tab switch mappings
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
nmap  <C-n> :tabnew<CR>
map  <C-c> :tabclose<CR>

" Config DevIcons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

" Syntax Highligh Config
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" NERDTree Visual Selection
g:nerdtree_vis_confirm_open
g:nerdtree_vis_confirm_delete
g:nerdtree_vis_confirm_copy
g:nerdtree_vis_confirm_move

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Terminal Configuration
nnoremap <C-x> :TerminalSplit bash<CR>

" Tagbar Configuration
nmap <F3> :TagbarToggle<CR>

" Find files using Telescope command line sugar
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Git Fugitive Configuration
nnoremap <C-g>a :Git add -A<cr>
nnoremap <C-g>c :Git commit -m "
nnoremap <C-g>p :Git push<cr>

" Other Mappings Configuration
nnoremap <C-s> :w<cr>
nnoremap <C-q> :q<cr>

" Navigation Mapping Configuration
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gi <Plug>(coc-implementation)
nnoremap <leader>gr <Plug>(coc-references)

nnoremap <leader>k :call ShowDocumentation()<CR>

nmap <leader>rn <Plug>(coc-rename)

" Coc Highlight Configuration
autocmd CursorHold * silent call CocActionAsync('highlight')

" Material Configuration
nnoremap <leader>mm :lua require('material.functions').toggle_style()<CR>

" ColorScheme Configuration
" :colorscheme material
" let g:material_style = "deep ocean"
hi Normal guibg=NONE ctermbg=NONE

" Emmet Configuration
nnoremap <C-e> <C-y>,

" Prettier Configuration
nnoremap <leader>p :CocCommand prettier.formatFile<cr>

" NerdTree Refresh
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('k', 'in')
  endif
endfunction
