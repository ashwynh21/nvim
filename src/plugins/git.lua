require("git").setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
	},
	default_mapping = true,
})
