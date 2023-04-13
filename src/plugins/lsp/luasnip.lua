local types = require("luasnip.util.types")
local luasnip = require("luasnip")

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
-- Loading any vscode snippets from plugins
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

-- Allow jsx and tsx to use js snippets
require("luasnip").filetype_extend("javascript", { "javascriptreact", "typescriptreact" })

-- Mappins to move around inside snippets
vim.keymap.set("i", "<S-Down>", '<cmd>lua require("luasnip").jump(1)<cr>')
vim.keymap.set("i", "<S-Up>", '<cmd>lua require("luasnip").jump(-1)<cr>')
vim.keymap.set("s", "<S-Down>", '<cmd>lua require("luasnip").jump(1)<cr>')
vim.keymap.set("s", "<S-Up>", '<cmd>lua require("luasnip").jump(-1)<cr>')

vim.keymap.set({ "i", "s" }, "<a-f>", function ()
  if luasnip.expand_or_jumpable() then
    luasnip.expand()
  end
end)
