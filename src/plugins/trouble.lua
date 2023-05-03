local which = require("which-key")

require("trouble").setup({})

local nmap = {
	x = {
    x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble Buffer" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble Workspace Buffer" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble Document Buffer" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble Quickfix Buffer" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Trouble LocList Buffer" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble LSP References" },
  },
}

which.register(nmap, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})
