require("neo-tree").setup({
	close_if_last_window = true,
	enable_diagnostics = true,
	enable_git_status = true,
	popup_border_style = "rounded",
	sort_case_insensitive = false,
	buffers = {
		follow_current_file = true, -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			},
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		use_libuv_file_watcher = true,
		follow_current_file = true,
		bind_to_cwd = true,
		cwd_target = {
			sidebar = "tab",
			current = "window",
		},
	},
	window = {
		width = 40,
		mappings = {
			["<leader>p"] = { "toggle_preview", config = { use_float = true } },
			["<leader>l"] = { "focus_preview" },
		},
	},
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = true,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		indent = {
			indent_size = 2,
			padding = 0, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "✚",
				modified = "",
				deleted = "✖",
				renamed = "",
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
	source_selector = {
		winbar = false, -- toggle to show selector on winbar
		statusline = false, -- toggle to show selector on statusline
		show_scrolled_off_parent_node = false, -- boolean
	  sources = { -- table
			filesystem = "  Files ", -- string | nil
			buffers = "  Buffers ", -- string | nil
			git_status = "  Git ", -- string | nil
			diagnostics = " 裂Diagnostics ", -- string | nil
		},
		content_layout = "start", -- string
		tabs_layout = "equal", -- string
		truncation_character = "…", -- string
		tabs_min_width = nil, -- int | nil
		tabs_max_width = nil, -- int | nil
		padding = 0, -- int | { left: int, right: int }
		separator = { left = "▏", right = "▕" }, -- string | { left: string, right: string, override: string | nil }
		separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
		show_separator_on_edge = false, -- boolean
		highlight_tab = "NeoTreeTabInactive", -- string
		highlight_tab_active = "NeoTreeTabActive", -- string
		highlight_background = "NeoTreeTabInactive", -- string
		highlight_separator = "NeoTreeTabSeparatorInactive", -- string
		highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
	},
})
