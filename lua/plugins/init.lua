return {
	-- the colorscheme should be available when starting Neovim
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.8, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer,
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
	},

	-- I have a separate config.mappings file where I require which-key.
	-- With lazy the plugin will be automatically loaded when it is required somewhere
	{
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"nvim-neorg/neorg",
		-- lazy-load on filetype
		ft = "norg",
		-- options for neorg. This will automatically call `require("neorg").setup(opts)`
		opts = {
			load = {
				["core.defaults"] = {},
			},
		},
	},

	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- if some code requires a module from an unloaded plugin, it will be automatically loaded.
	-- So for api plugins like devicons, we can always set lazy=true
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	-- you can use the VeryLazy event for things that can
	-- load later and are not important for the initial UI
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	{
		"monaqa/dial.nvim",
		-- lazy-load on keys
		-- mode is `n` by default. For more advanced options, check the section on key mappings
		keys = { "<C-a>", { "<C-x>", mode = "n" } },
	},

	-- local plugins need to be explicitly configured with dir
	{ dir = "~/projects/secret.nvim" },

	-- you can use a custom url to fetch a plugin
	{ url = "git@github.com:folke/noice.nvim.git" },

	-- local plugins can also be configured with the dev option.
	-- This will use {config.dev.path}/noice.nvim/ instead of fetching it from GitHub
	-- With the dev option, you can easily switch between the local and installed version of a plugin
	{ "folke/noice.nvim", dev = true },

	{ "voldikss/vim-floaterm" },

	{ "nvim-lua/plenary.nvim" },

	{ "shaunsingh/solarized.nvim" },

	{ "catppuccin/nvim", as = "catppuccin" },

	{
		"loctvl842/monokai-pro.nvim",
	},

	{ "rose-pine/neovim", as = "rose-pine" },

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{ "mattn/emmet-vim" },
	{
		"onsails/lspkind.nvim",
	},

	{ "nvim-lua/popup.nvim" },
}
