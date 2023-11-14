local nls = require("null-ls")
local U = require("src.plugins.lsp.utils")

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local cda = nls.builtins.code_actions

local file_exists = function(file)
	local f = io.open(file, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

-- Configuring null-ls
nls.setup({
	sources = {
		----------------
		-- FORMATTING --
		----------------
		fmt.trim_whitespace.with({
			filetypes = { "text", "zsh", "toml", "make", "conf", "tmux" },
		}),
		-- NOTE:
		-- 1. both needs to be enabled to so prettier can apply eslint fixes
		-- 2. prettierd should come first to prevent occasional race condition
		fmt.prettier,
		fmt.eslint.with({
			extra_args = function(params)
				local file_types = { "js", "cjs", "yaml", "yml", "json" }
				for _, file_type in pairs(file_types) do
					if file_exists(params.root .. "/.eslintrc." .. file_type) then
						return {
							"--config",
							vim.fn.expand(params.root .. "/.eslintrc." .. file_type),
						}
					end
				end

				return {
					"--config",
					vim.fn.expand("path/to/default/.eslintrc.js"),
				}
			end,
		}),
		fmt.stylua,
		fmt.golines,
		fmt.shfmt.with({
			extra_args = { "-i", 2, "-ci", "-sr" },
		}),
		-----------------
		-- DIAGNOSTICS --
		-----------------
		dgn.eslint.with({
			timeout = 4800,
		}),
		-- dgn.misspell.with({
		--   timeout = 4800,
		-- }),
		dgn.shellcheck,
		dgn.gospel,
		------------------
		-- CODE ACTIONS --
		------------------
		cda.eslint.with({
			method = nls.methods.DIAGNOSTICS_ON_SAVE,
		}),
		-- cda.gitsigns.with({
		--   method = nls.methods.DIAGNOSTICS_ON_SAVE,
		-- }),
		cda.shellcheck,
	},
	on_attach = function(_, bufnr)
		U.mappings(bufnr)
	end,
})
