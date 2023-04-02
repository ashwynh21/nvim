local map = vim.keymap.set
local which = require("which-key")

local U = {}

---LSP servers capabilities w/ nvim-cmp
function U.capabilities()
	-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

---Disable formatting for servers | Handled by null-ls
---@param client table
---@see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
function U.disable_formatting(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

---Creates LSP mappings
---@param buf number
function U.mappings(buf)
	local keys = {
		["<leader>f"] = { "<cmd>lua vim.lsp.buf.format({timeout_ms = 20000})<cr>", "Format File" },
		["<leader>gd"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		["<leader>r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Refactor Name" },
		["<leader>c"] = { "<cmd>Lspsaga code_action<cr>", "Code Actions" },
		["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics" },
		["<C-h>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		g = {
			d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
			h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Information" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go To Implementation" },
			r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Show References" },
			t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		},
	}

	which.register(keys, {
		mode = "n",
		prefix = "",
		buffer = buf,
		silent = true,
		noremap = true,
		nowait = false,
	})
end

return U
