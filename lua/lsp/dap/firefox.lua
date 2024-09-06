local dap = require("dap")

-- firefox debugging
dap.adapters.firefox = {
	type = "executable",
	command = "node",
	-- args = { "C:/Users/ashwy/AppData/Local/nvim-data/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js" },
	args = { "C:/Users/ashwy/dev/dap/vscode-firefox-debug/dist/adapter.bundle.js" },
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
		name = "Debug with Firefox",
		type = "firefox",
		request = "attach",
		reAttach = true,
		sourceMaps = true,
		url = url,
		host = "127.0.0.1",
		timeout = 20000,
		port = 6000,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.javascript = {
	{
		name = "Debug with Firefox",
		type = "firefox",
		request = "attach",
		reAttach = true,
		sourceMaps = true,
		url = url,
		port = 6000,
		host = "127.0.0.1",
		timeout = 20000,
		webRoot = "${workspaceFolder}",
	},
}
