-- [[ keys.lua ]]

vim.g.mapleader = '\\'

-- 1. our general keybindings will go here
--
local map = vim.api.nvim_set_keymap

-- [[ NERDTree ]]
map('n', '<leader>n', ':NERDTreeFocus<CR>', {})

map('n', '<C-a>', ':NERDTree<CR>', {})
map('n', '<C-t>', ':NERDTreeToggle<CR>', {})
map('n', '<C-f>', ':NERDTreeFind<CR>', {})

-- to start nerdtree automatically
vim.api.nvim_create_autocmd('VimEnter', { command = 'NERDTree' })

-- to close vim if nerdtree is the only buffer remaining
vim.api.nvim_create_autocmd('bufenter', {
	command = 'if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'
})

-- NerdTree refresh
map('n', '<Leader>r', ':NERDTreeFocus<CR> | R | <C-w><C-p>', {})

-- setup the way nerdtree looks and is positioned
vim.g.NERDTreeWinSize = 40
vim.g.NERDTreeWinPos = "left"
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeAutoDeleteBuffer = 1

vim.g.nerdtree_vis_confirm_open = true
vim.g.nerdtree_vis_confirm_delete = true
vim.g.nerdtree_vis_confirm_copy = true
vim.g.nerdtree_vis_confirm_move = true

-- [[ Tab Controls ]]
map('n', '<C-l>', ':tabn<CR>', {})
map('n', '<C-h>', ':tabp<CR>', {})
map('n', '<C-n>', ':tabnew<CR>', {})
map('n', '<C-c>', ':tabclose<CR>', {})

-- [[ Config DevIcons ]]
vim.g.webdevicons_enable = 1
vim.g.webdevicons_enable_nerdtree = 1

-- [[ Syntax Highlight ]]
vim.g.WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
vim.g.WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

-- [[ COC Vim ]]
map('n', '<expr> <Tab>', 'pumvisible() ? coc#_select_confirm() : \"<Tab>\"', {})
map('n', '<C-x>', ':TerminalSplit bash<CR>', {})
map('n', '<F3>', ':TagbarToggle<CR>', {})

map('n', '<silent>[g', '<Packer>(coc-diagnostic-prev)', {})
map('n', '<silent>]g', '<Packer>(coc-diagnostic-next)', {})

map('n', '<leader>gd', '<Packer>(coc-definition)', {})
map('n', '<leader>gi', '<Packer>(coc-implementation)', {})
map('n', '<leader>gr', '<Packer>(coc-references)', {})

map('n', '<leader>k', ':call ShowDocumentation()<CR>', {})
map('n', '<leader>rn', '<Packer>(coc-rename)', {})

vim.api.nvim_create_autocmd('CursorHold', {
	command = 'silent call CocActionAsync(\"highlight\")'
})

-- [[ Telescope ]]
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', {})
map('n', '<leader>fs', '<CMD>Telescope grep_string<CR>', {})
map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', {})
map('n', '<leader>fb', '<CMD>Telescope buffers<CR>', {})
map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', {})

-- [[ Git ]]
map('n', '<C-g>a', ':Git add -A<CR>', {})
map('n', '<C-g>c', ':Git commit -m \"', {})
map('n', '<C-g>p', ':Git push<CR>', {})

-- [[ General ]]
map('n', '<C-s>', ':w<CR>', {})
map('n', '<C-q>', ':q<CR>', {})

-- [[ Material Theme ]]

-- [[ Emmet ]]

-- [[ Prettier ]]
map('n', '<leader>p', ':CocCommand prettier.formatFile<CR>', {})

-- [[ FZF ]]
vim.g.ackprg = 'ag --vimgrep'

function ShowDocumentation()
  if CocAction('hasProvider', 'hover') then
    CocActionAsync('doHover')
  else
  	feedkeys('k', 'in')
  end
end

