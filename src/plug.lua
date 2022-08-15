-- [[ plug.lua ]]

-- 1. start by setting up packer
--
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
	'BufWritePost',
	{ command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' }
)

-- 2. we call the startup and add our plugins
--
require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
	
	-- [[ NERDTree ]]
	use {
		'preservim/nerdtree',
		requires = 'Xuyuanp/nerdtree-git-plugin'
	}
	-- [[ Icons ]]
	use 'ryanoasis/vim-devicons'
	use {
  	'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'vim-airline/vim-airline'
	use 'preservim/tagbar'
	use 'neoclide/coc.nvim'
	use 'marko-cerovac/material.nvim'
	use 'glepnir/dashboard-nvim'
	use 'tpope/vim-fugitive'
	use 'nvim-lua/plenary.nvim'
	use 'cohama/lexima.vim'
	use 'mattn/emmet-vim'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-treesitter/nvim-treesitter'
end)

-- [[ LuaLine ]]
require('lualine').setup({
	theme = 'dracula'
})
