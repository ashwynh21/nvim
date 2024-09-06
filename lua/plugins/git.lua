return {
	{
		"dinhhuy258/git.nvim",
		config = function()
			require("git").setup({
				keymaps = {
					-- Open blame window
					blame = "<Leader>gb",
					-- Open file/folder in git repository
					browse = "<Leader>go",
				},
				default_mapping = true,
			})
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = function() end,
	},
	{
		"akinsho/git-conflict.nvim",
		tag = "v2.0.0",
		config = function()
			require("git-conflict").setup()
		end,
	},
}
