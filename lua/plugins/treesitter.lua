return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "CursorHold",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.install").compilers = { "clang", "zig", "gcc" }
			require("nvim-treesitter.install").target = "x86_64-w64-windows-gnu"

			require("nvim-treesitter.configs").setup({
				-- nvim-treesitter/nvim-treesitter (self config)
				auto_install = true,
				sync_install = false,
				ensure_installed = {
					"tsx",
					"lua",
					"javascript",
					"typescript",
					"go",
					"rust",
					"markdown",
					"html",
					"css",
					"scss",
					"json",
				},
				highlight = {
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					indent = {
						enable = true,
					},
					enable = true,
					keymaps = {
						init_selection = "ss",
						-- NOTE: These are visual mode mappings
						node_incremental = "ss",
						node_decremental = "sS",
						scope_incremental = "<leader>sc",
					},
				},
				-- nvim-treesitter/nvim-treesitter-textobjects
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["uc"] = "@comment.outer",

							-- Or you can define your own textobjects like this
							-- ["iF"] = {
							--     python = "(function_definition) @function",
							--     cpp = "(function_definition) @function",
							--     c = "(function_definition) @function",
							--     java = "(method_declaration) @function",
							-- },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
							["<leader>f"] = "@function.outer",
							["<leader>e"] = "@element",
						},
						swap_previous = {
							["<leader>F"] = "@function.outer",
							["<leader>A"] = "@parameter.inner",
							["<leader>E"] = "@element",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
				},
				-- windwp/nvim-ts-autotag
				autotag = {
					enable = true,
				},
				-- nvim-treesitter/playground
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
				},
				-- nvim-treesitter/nvim-treesitter-refactor
				refactor = {
					highlight_definitions = { enable = true },
					-- highlight_current_scope = { enable = false },
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
		end,
	},

	{ "nvim-treesitter/playground", after = "nvim-treesitter" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
	{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
	{
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
}
