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
