local dap = require("dap")

-- firefox debugging
dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { "C:/Users/ashwy/dev/dap/vscode-chrome-debug/out/src/chromeDebug.js" },
}

local url = function()
	local co = coroutine.running()
	return coroutine.create(function()
		vim.ui.input({
			prompt = "Enter URL: ",
			default = "http://localhost:4200",
		}, function(url)
			if url == nil or url == "" then
				return
			end

			coroutine.resume(co, url)
		end)
	end)
end

dap.configurations.typescript = {
	{
		name = "Debug with Chrome",
		type = "chrome",
		request = "attach",
		reAttach = true,
		sourceMaps = true,
		url = url,
		host = "127.0.0.1",
		timeout = 20000,
		port = 9222,
		protocol = "inspector",
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.javascript = {
	{
		name = "Debug with Chrome",
		type = "chrome",
		request = "attach",
		reAttach = true,
		sourceMaps = true,
		url = url,
		port = 9222,
		host = "127.0.0.1",
		protocol = "inspector",
		timeout = 20000,
		webRoot = "${workspaceFolder}",
	},
}
