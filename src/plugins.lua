--Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup({
	function(use)
		---------------------
		-- Package Manager --
		---------------------
		use("wbthomason/packer.nvim")

		---------------------
		--    Required     --
		---------------------
		use("nvim-lua/plenary.nvim")

		---------------------
		--   Navigation    --
		---------------------
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("src.plugins.neotree")
			end,
		})

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
			"glepnir/dashboard-nvim",
			event = "VimEnter",
			config = function()
				require("src.plugins.dashboard")
			end,
			requires = { "nvim-tree/nvim-web-devicons" },
		})
		use({
			"nvim-telescope/telescope-file-browser.nvim",
		})

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
		use("folke/tokyonight.nvim")
		use({
			"loctvl842/monokai-pro.nvim",
		})
		-----------------------------------
		-- Treesitter: Better Highlights --
		-----------------------------------
		use({
			{
				"nvim-treesitter/nvim-treesitter",
				event = "CursorHold",
				run = ":TSUpdate",
				confid = function()
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
			"akinsho/git-conflict.nvim",
			tag = "*",
			config = function()
				require("git-conflict").setup()
			end,
		})
		use("mattn/emmet-vim")
		use({
			"kosayoda/nvim-lightbulb",
			requires = "antoinemadec/FixCursorHold.nvim",
			config = function()
				require("src.plugins.lightbulb")
			end,
		})
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
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = function()
				require("src.plugins.lsp.null")
			end,
		})
		use({
			"glepnir/lspsaga.nvim",
			opt = true,
			branch = "main",
			event = "LspAttach",
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
					{
						"L3MON4D3/LuaSnip",
						event = "InsertEnter",
						config = function()
							require("src.plugins.lsp.luasnip")
						end,
						requires = {
							{
								"rafamadriz/friendly-snippets",
								event = "CursorHold",
							},
						},
					},
				},
			},
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		})
		use({
			"mfussenegger/nvim-dap",
			opt = true,
			event = "BufReadPre",
			module = { "dap" },
			wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
			requires = {
				"Pocco81/DAPInstall.nvim",
				"theHamsta/nvim-dap-virtual-text",
				"rcarriga/nvim-dap-ui",
				"mfussenegger/nvim-dap-python",
				"nvim-telescope/telescope-dap.nvim",
				{ "leoluz/nvim-dap-go", module = "dap-go" },
				{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
			},
			config = function()
				-- require("src.plugins.dap.init").setup()
			end,
		})
		use({
			"jay-babu/mason-nvim-dap.nvim",
		})
		use({
			"Pocco81/DAPInstall.nvim",
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
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
