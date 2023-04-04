vim.opt.termguicolors = true

require("bufferline").setup({
	options = {
		mode = "buffers",
		separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "neo-tree",
				text = vim.fn.getcwd(),
				highlight = "Directory",
				text_align = "center",
        padding = 0,
			},
		},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
