return {
	{
		"phaazon/hop.nvim",
		branch = "v2",
		event = "BufRead",
		config = function()
			require("hop").setup({
				keys = "qwerasdfzxcv",
			})

			local keys = {
				["<C-Down>"] = { "<cmd>HopWordAC<cr>", "Hop Down" },
				["<C-Up>"] = { "<cmd>HopWordBC<cr>", "Hop Up" },
			}

			require("which-key").register(keys, {
				mode = "n",
				prefix = "",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = false,
			})
		end,
	},
}
