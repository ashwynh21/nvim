--Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "*.lua",
	command = "source <afile> | PackerCompile",
})

local packer = function(use)
	---------------------
	-- Package Manager --
	---------------------
	use("wbthomason/packer.nvim")
end

local required = function(use)
	---------------------
	--    Required     --
	---------------------
	use("nvim-lua/plenary.nvim")
end

local navigation = function(use)
	---------------------
	--   Navigation    --
	---------------------
	use({
		{
			"nvim-telescope/telescope.nvim",
			event = "CursorHold",
			config = function()
				require("src.plugins.telescope")
			end,
		},
		{
			"nvim-telescope/telescope-symbols.nvim",
			after = "telescope.nvim",
		},
		{
			"nvim-telescope/telescope-dap.nvim",
		},
	})
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("src.plugins.bufferline")
		end,
	})
	use({
		"fgheng/winbar.nvim",
		config = function()
			require("src.plugins.winbar")
		end,
	})
	use({
		"phaazon/hop.nvim",
		branch = "v2",
		event = "BufRead",
		config = function()
			require("src.plugins.hop")
		end,
	})
	use({
		"nvim-telescope/telescope-file-browser.nvim",
	})
	use("voldikss/vim-floaterm")

	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("src.plugins.nvimtree")
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"folke/twilight.nvim",
		{
			dimming = {
				alpha = 0.8, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 24, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {}, -- exclude these filetypes
		},
	})
end

local theme = function(use)
	----------------------------------------
	-- Theme, Icons, Statusbar, Bufferbar --
	----------------------------------------
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	})
	use({
		{
			"nvim-lualine/lualine.nvim",
			event = "BufEnter",
			config = function()
				require("src.plugins.lualine")
			end,
		},
		{
			"j-hui/fidget.nvim",
			after = "lualine.nvim",
			config = function()
				require("fidget").setup()
			end,
		},
	})
	-----------------------------------
	----------- Theming ---------------
	-----------------------------------
	use("shaunsingh/solarized.nvim")
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("src.plugins.tokyonight")
		end,
	})
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({
		"loctvl842/monokai-pro.nvim",
	})
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({
		"xiyaowong/transparent.nvim",
		config = function()
			require("src.plugins.transparent")
		end,
	})
end

local treesitter = function(use)
	-----------------------------------
	-- Treesitter: Better Highlights --
	-----------------------------------
	use({
		{
			"nvim-treesitter/nvim-treesitter",
			event = "CursorHold",
			run = ":TSUpdate",
			config = function()
				require("src.plugins.treesitter")
			end,
		},
		{ "nvim-treesitter/playground", after = "nvim-treesitter" },
		{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
		{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
		{
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
			config = function()
				require("nvim-ts-autotag").setup({})
			end,
		},
		{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
end

local editor = function(use)
	--------------------------
	-- Editor UI Niceties --
	--------------------------
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("src.plugins.indentline")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("src.plugins.gitsigns")
		end,
	})
	use({
		"rhysd/git-messenger.vim",
		event = "BufRead",
		config = function()
			require("src.plugins.gitmessenger")
		end,
	})
	use({
		"dinhhuy258/git.nvim",
		config = function()
			require("src.plugins.git")
		end,
	})
	use({
		"f-person/git-blame.nvim",
		config = function() end,
	})
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})
	use("mattn/emmet-vim")
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("src.plugins.surround")
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("src.plugins.trouble")
		end,
	})
	use({
		"tpope/vim-fugitive",
	})
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("src.plugins.dressing")
		end,
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("src.plugins.notify")
		end,
	})
end

local completion = function(use)
	-----------------------------------
	-- LSP, Completions and Snippets --
	-----------------------------------
	use({
		"neovim/nvim-lspconfig",
		event = "BufRead",
		config = function()
			require("src.plugins.lsp.servers")
		end,
		requires = {
			{
				"hrsh7th/cmp-nvim-lsp",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
		},
	})
	use({
		"https://gitlab.com/schrieveslaach/sonarlint.nvim",
		as = "sonarlint.nvim",
		event = "BufRead",
		config = function()
			require("src.plugins.sonar")
		end,
		requires = {
			{
				"neovim/nvim-lspconfig",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
		},
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function()
			require("src.plugins.lsp.null")
		end,
	})
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("src.plugins.saga")
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use({
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			config = function()
				require("src.plugins.lsp.nvim-cmp")
			end,
			requires = {
				"L3MON4D3/LuaSnip",
			},
		},
		{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	})
	use({
		"L3MON4D3/LuaSnip",
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
		config = function()
			require("src.plugins.lsp.luasnip")
		end,
		requires = {
			{
				"rafamadriz/friendly-snippets",
				event = "CursorHold",
			},
		},
	})
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
	use({
		"windwp/nvim-autopairs",
		event = "InsertCharPre",
		after = "nvim-cmp",
		config = function()
			require("src.plugins.pairs")
		end,
	})
	use({
		"onsails/lspkind.nvim",
	})
	use("nvim-lua/popup.nvim")
end

local dap = function(use)
	-----------------------
	-------- DAP ----------
	-----------------------
	use({
		"mfussenegger/nvim-dap",
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("src.plugins.dap.dap")
		end,
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap" },
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
end

return require("packer").startup({
	function(use)
		packer(use)
		required(use)
		navigation(use)
		theme(use)
		treesitter(use)
		editor(use)
		completion(use)
		dap(use)
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
