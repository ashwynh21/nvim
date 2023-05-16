local dap = require("dap")

-- go debugging
dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
		protocol = "inspector",
		cwd = vim.fn.getcwd(),
	},
	{
		type = "delve",
		name = "Debug Test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
		protocol = "inspector",
		cwd = vim.fn.getcwd(),
	},
}

