local which = require("which-key")

-- key bindings for DAP

local step = {
	o = { '<cmd>lua require("dap").step_over()<cr>', "Over" },
	i = { '<cmd>lua require("dap").step_into()<cr>', "Into" },
	u = { '<cmd>lua require("dap").step_out()<cr>', "Out" },
	b = { '<cmd>lua require("dap").step_back()<cr>', "Back" },
	"Step",
}

local widget = {
	h = { '<cmd>lua require("dap.ui.widgets").hover()<cr>', "Hover" },
	p = { '<cmd>lua require("dap.ui.widgets").preview()<cr>', "Preview" },
	f = {
		function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end,
		"Center Foat Preview",
	},
	s = {
		function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end,
		"Scopes",
	},
	"Widgets",
}

local nmap = {
	d = {
		s = step,
		w = widget,

	  c = { '<cmd>lua require("dap").continue()<cr>', "Continue" },
		d = { '<cmd>lua require("dap").disconnect()<cr>', "Disconnect" },
		b = { '<cmd>lua require("dap").toggle_breakpoint()<cr>', "Toggle Breakpoint" },
    g = { "<cmd>lua require('dap').session()<cr>", "Get Session" },

    p = { "<cmd>lua require('dap').pause()<cr>", "Pause" },
    o = { "<cmd>lua require('dap').pause()<cr>", "Resume" },

    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },

		r = { '<cmd>lua require("dap").repl.toggle()<cr>', "Repl Toggle" },
		l = { '<cmd>lua require("dap").run_last()<cr>', "Run Last" },
		t = { "lua require('dap').set_log_level('TRACE')<cr>", "Trace" },

    u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },

		B = { '<cmd>lua require("dap").set_breakpoint()<cr>', "Debug Set Breakpoint" },
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
		"Debug",
	},
}

which.register(nmap, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})
