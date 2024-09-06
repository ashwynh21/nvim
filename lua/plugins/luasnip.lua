return {
	{
		"L3MON4D3/LuaSnip",
		tag = "v2.3.0",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
		config = function()
			require("lsp.lsp.luasnip")
		end,
		requires = {
			{
				"rafamadriz/friendly-snippets",
				event = "CursorHold",
			},
		},
	},
}
