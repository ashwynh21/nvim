vim.notify = require("notify")

vim.notify.setup({
	background_colour = "NotifyBackground",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 3,
	minimum_width = 50,
	maximum_width = 256,
	render = "default",
	stages = "fade_in_slide_out",
	timeout = 5000,
	top_down = true,
})
