vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		mode = "buffers",
		separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		diagnostics = "nvim_lsp",
	},
	highlights = {
		separator = {
			fg = "#202A3d",
			bg = "#202A3d",
		},
		separator_selected = {
			fg = "#202A3d",
		},
		background = {
			fg = "#766583",
			bg = "#212838",
		},
		buffer_selected = {
			fg = "#fdf6f3",
		},
		fill = {
			bg = "#202A3d",
		},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

