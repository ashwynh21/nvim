return {
	{
		"https://gitlab.com/schrieveslaach/sonarlint.nvim",
		as = "sonarlint.nvim",
		event = "BufRead",
		config = function()
			require("sonarlint").setup({
				server = {
					cmd = {
						"sonarlint-language-server.cmd",
						-- Ensure that sonarlint-language-server uses stdio channel
						"-stdio",
						"-analyzers",
						-- paths to the analyzers you need, using those for python and java in this example
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarts.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarhtml.jar"),
					},
				},
				filetypes = {
					-- Tested and working
					"python",
					"cpp",
					"javascript",
					"typescript",
				},
			})
		end,
		requires = {
			{
				"neovim/nvim-lspconfig",
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
		},
	},
}
