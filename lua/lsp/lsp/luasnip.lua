local types = require("luasnip.util.types")
local luasnip = require("luasnip")

-- load in the snippets directory
require("luasnip.loaders.from_lua").load({ paths = "C:/Users/ashwy/AppData/Local/nvim/lua/lsp/snippets/" })
luasnip.config.setup({ store_selection_keys = "<C-p>" })

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

-- allow jsx and tsx to use js snippets
require("luasnip").filetype_extend("javascript", { "javascriptreact", "typescriptreact" })

luasnip.setup({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "DiffDelete" } },
			},
		},
	},
})

-- Mappins to move around inside snippets
vim.keymap.set({"i", "s"}, "<a-s>", '<cmd>lua require("luasnip").jump(1)<cr>')
vim.keymap.set({"i", "s"}, "<a-w>", '<cmd>lua require("luasnip").jump(-1)<cr>')

vim.keymap.set({"i", "s" }, "<a-d>", '<cmd>lua require("luasnip.extras.select_choice")()<cr>')

vim.keymap.set({ "i", "s" }, "<a-f>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand()
	end
end)

vim.keymap.set("n", "<leader><cr>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <cr> /-- End Refactoring --<cr>O<esc>O]])
