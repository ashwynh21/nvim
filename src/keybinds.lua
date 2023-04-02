local which = require("which-key")

local keymap = {
  ["<leader>"] = {
    t = { ":Neotree toggle left<cr>", "Toggle NeoTree" },
    g = { ":Neotree git_status toggle float<cr>", "Toggle Git Status" },
    ["["] = { ":bp<cr>", "Previous Tab" },
    ["]"] = { ":bn<cr>", "Next Tab" }
  },
  ["<C-s>"] = { ":w!<cr>", "Save Changes" },
  ["<C-q>"] = { ":q<cr>", "Close Tab" },
}

which.register(keymap, {
		mode = "n",
		prefix = "",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
})

