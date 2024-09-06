return {
	{
		"j-hui/fidget.nvim",
		after = "lualine.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
}
