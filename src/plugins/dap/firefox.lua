local dap = require("dap")

-- firefox debugging
dap.adapters.firefox = {
	type = "executable",
	command = "node",
	args = { "C:/Users/ashwy/AppData/Local/nvim-data/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js" },
}

dap.configurations.javascript = {
	{
		type = "firefox",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9200,
    url = "http://localhost:4200",
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.typescript = {
	{
		name = "Debug Angular with Firefox",
		type = "firefox",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		reAttach = true,
		protocol = "inspector",
		port = 9200,
		url = "http://localhost:4200",
		webRoot = "${workspaceFolder}",
	},
}
