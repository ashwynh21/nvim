return {
	{
		"rhysd/git-messenger.vim",
		event = "BufRead",
		config = function()
			vim.g.git_messenger_no_default_mappings = true
			vim.g.git_messenger_close_on_cursor_moved = false

			vim.keymap.set("n", "gm", "<CMD>GitMessenger<CR>")
		end,
	},
}
