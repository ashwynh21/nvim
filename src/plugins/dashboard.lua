local db = require("dashboard")
db.custom_header = {
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
}
db.custom_center = {
	{
		icon = " ",
		desc = "New File            ",
		action = "DashboardNewFile",
		shortcut = "\\ o",
	},
	{
		icon = " ",
		desc = "Browse Files        ",
		action = "Telescope file_browser",
		shortcut = "\\ n",
	},
	{
		icon = " ",
		desc = "Find File           ",
		action = "Telescope find_files",
		shortcut = "\\ f f",
	},
	{
		icon = " ",
		desc = "Configure Neovim    ",
		action = "edit C:/Users/ashwyn/AppData/Local/nvim/init.lua",
		shortcut = "\\ v",
	},
	{
		icon = " ",
		desc = "Exit Neovim              ",
		action = "quit",
	},
}
vim.keymap.set("n", "<Leader>o", ":DashboardNewFile<CR>", { silent = true })
