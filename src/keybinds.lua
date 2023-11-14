local which = require("which-key")

local nmap = {
	["<leader>"] = {
		["["] = { ":bp<cr>", "Previous Tab" },
		["]"] = { ":bn<cr>", "Next Tab" },
	},
	["<C-s>"] = { ":w!<cr>", "Save Changes" },
	["<S-c>"] = { ":bw<cr>:bp<cr>", "Close File" },
	["<S-q>"] = { ":qa<cr>", "Quit" },
}

local vmap = {
  ["<S-Up>"] = { ":m '<-2<cr>gv=gv", "Move Highlighted Up" },
  ["<S-Down>"] = { ":m '>+1<cr>gv=gv", "Move Highlighted Down" },
}

local xmap = {
  P = { "\"_dP", "Paste" }
}

which.register(nmap, {
	mode = "n",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
  nowait = false,
})

which.register(vmap, {
	prefix = "",
	noremap = true,
	nowait = false,
  mode = "v",
  buffer = nil,
  silent = true,
})

which.register(xmap, {
	prefix = "",
	noremap = true,
	nowait = false,
  mode = "x",
  buffer = nil,
  silent = true,
})
