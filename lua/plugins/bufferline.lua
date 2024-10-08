return {

	{
		"akinsho/bufferline.nvim",
		tag = "v4.7.0",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true

			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "thin",
					close_command = "bdelete! %d",
					always_show_bufferline = true,
					show_buffer_close_icons = true,
					show_buffer_icons = true,
					show_close_icon = true,
					color_icons = true,
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "neo-tree",
							text = vim.fn.getcwd(),
							highlight = "Directory",
							text_align = "center",
							offset_separator = false,
							padding = 1,
						},
					},
				},
			})
		end,
	},
}
