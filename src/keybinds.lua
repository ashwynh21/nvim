local which = require("which-key")

local keymap = {
  ["<leader>"] = {
    t = { ":NvimTreeToggle<cr>", "Toggle NeoTree" },
    ["["] = { ":bp<cr>", "Previous Tab" },
    ["]"] = { ":bn<cr>", "Next Tab" }
  },
  ["<C-s>"] = { ":w!<cr>", "Save Changes" },
  ["<C-q>"] = { ":q<cr>", "Close Tab" },
  ["<S-q>"] = { ":q!<cr>", "Quit" },
}

which.register(keymap, {
		mode = "n",
		prefix = "",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
})

