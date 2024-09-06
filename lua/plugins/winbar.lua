return {
	{
		"fgheng/winbar.nvim",
		config = function()
			require("winbar").setup({
				enabled = true,
				icons = {
					file_icon_default = "",
					seperator = ">",
					editor_state = "●",
					lock_icon = "",
				},
			})
		end,
	},
}
