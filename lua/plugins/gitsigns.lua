return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			local map = vim.keymap.set

			require("gitsigns").setup({
				signs = {
					add = { text = "*" },
					change = { text = "~" },
					delete = { text = "_" },
					changedelete = { text = "=" },
				},
				on_attach = function(buf)
					-- Navigation
					map("n", "]c", "&diff ? ']c' : '<CMD>Gitsigns next_hunk<CR>'", { buffer = buf, expr = true })
					map("n", "[c", "&diff ? '[c' : '<CMD>Gitsigns prev_hunk<CR>'", { buffer = buf, expr = true })

					-- Actions
					map({ "n", "v" }, "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", { buffer = buf })
					map({ "n", "v" }, "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>")
					map("n", "<leader>hS", "<CMD>Gitsigns stage_buffer<CR>", { buffer = buf })
					map("n", "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>", { buffer = buf })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = buf })
				end,
			})
		end,
	},
}
