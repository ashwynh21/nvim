local actions = require("telescope.actions")
local A = vim.api

require("telescope").setup({
	defaults = {
		prompt_prefix = " ❯ ",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		file_ignore_patterns = {
			"node_modules",
			".git",
		},
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<C-s>"] = actions.send_selected_to_qflist,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- "smart_case" | "ignore_case" | "respect_case"
		},
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

_G.Telescope = setmetatable({}, {
	__index = function(_, k)
		if vim.bo.filetype == "NvimTree" then
			A.nvim_cmd({ cmd = "wincmd", args = { "l" } }, {})
		end
		return require("telescope.builtin")[k]
	end,
})

local keymaps = {
	f = {
		a = { "<cmd>lua vim.lsp.buf.format({timeout_ms = 20000})<cr>", "Format File" },
		f = { "<cmd>lua Telescope.find_files({ hidden = true })<cr>", "Find File" },
		h = { "<cmd>lua Telescope.help_tags()<cr>", "Help Tags" },
		b = { "<cmd>lua Telescope.buffers()<cr>", "Find Buffer" },
		g = { "<cmd>lua Telescope.live_grep()<cr>", "Live Grep" },
		c = { "<cmd>lua Telescope.git_status()<cr>", "Git Status" },

    t = { "<cmd>FloatermToggle<cr>", "Toggle Terminal" },
    n = { "<cmd>FloatermNew<cr>", "New Terminal" },
    x = { "<cmd>FloatermKill!<cr>", "Kill Terminal" }
	},
}

require("which-key").register(keymaps, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = false,
	noremap = true,
	nowait = false,
})

require("telescope").load_extension("file_browser")
