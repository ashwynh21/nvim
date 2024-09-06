return {
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		config = function()
			require("lsp.lsp.servers")
		end,
		requires = {
			{
				"hrsh7th/cmp-nvim-lsp",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function()
			require("lsp.lsp.null")
		end,
	},
}
