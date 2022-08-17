require("lualine").setup({
	options = {
		theme = "horizon",
		icons_enabled = true,
		globalstatus = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {
			{ "mode", color = { gui = "bold" } },
		},
		lualine_b = {
			{ "branch" },
			{ "diff", colored = false },
		},
		lualine_c = {
			{ "filename", file_status = true },
			{ "diagnostics" },
		},
		lualine_x = {
			"filetype",
			"encoding",
			"fileformat",
		},
		lualine_y = { "progress" },
		lualine_z = {
			{ "location", color = { gui = "bold" } },
		},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				buffers_color = { active = "lualine_b_normal" },
			},
		},
		lualine_z = {
			{
				"tabs",
				tabs_color = { active = "lualine_b_normal" },
			},
		},
	},
	extensions = { "quickfix", "nvim-tree", "fugitive" },
})
