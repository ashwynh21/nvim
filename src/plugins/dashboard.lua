local db = require("dashboard")

db.setup({
	theme = "hyper",
	config = {
		header = {
			"",
			"",
			"",
			"",
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
			"",
			"",
			"",
			"",
			"",
			"",
		},
		shortcut = {
			{
				icon = " ",
				desc = "New File            ",
				action = "DashboardNewFile",
				key = "\\ o",
			},
			{
				icon = " ",
				desc = "Browse Files        ",
				action = "Telescope file_browser",
				key = "\\ t",
			},
			{
				icon = " ",
				desc = "Find File           ",
				action = "Telescope find_files",
				key = "\\ f f",
			},
			{
				icon = " ",
				desc = "Configure Neovim    ",
				action = "edit C:/Users/ashwyn/AppData/Local/nvim/init.lua",
				key = "\\ v",
			},
			{
				icon = " ",
				desc = "Exit Neovim              ",
				action = "quit",
			},
		},
    packages = { enable = true },
    project = { enable = true, limit = 8, label = '', action = 'Telescope find_files cwd=' },
    week_header = { enable = true },
		footer = {},
	},
})
vim.keymap.set("n", "<Leader>o", ":DashboardNewFile<CR>", { silent = true })
