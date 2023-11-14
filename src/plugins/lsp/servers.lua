local lsp = require("lspconfig")
local U = require("src.plugins.lsp.utils")

---Common perf related flags for all the LSP servers
local flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}

---Common capabilities including lsp snippets and autocompletion
local capabilities = U.capabilities()

---Common `on_attach` function for LSP servers
---@param client table
---@param buf integer
local function on_attach(client, buf)
	U.disable_formatting(client)
	U.mappings(buf)

	-- Find the clients capabilities
	local cap = client.server_capabilities

	vim.o.updatetime = 1000
	if cap.document_highlight then
		vim.cmd([[
      augroup LspHighlight
		    autocmd!
        autocmd CursorHold,CursorHoldI * silent! lua vim.diagnostic.open_float(nil, {focus=false})
		    autocmd CursorHold,CursorHoldI * silent! lua vim.lsp.buf.document_highlight()
		    autocmd CursorMoved * silent! lua vim.lsp.buf.clear_references()
		  augroup END
    ]])
	end
end

-- Configuring native diagnostic
vim.lsp.handlers["textDocument/codeAction"] = vim.lsp.with(vim.lsp.handlers.code_action, {
	-- Use a sharp border with `FloatBorder` highlights
	border = "rounded",
	style = "minimal",
	-- add the title in hover float window
	title = "code action",
	float = true,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- Use a sharp border with `FloatBorder` highlights
	border = "rounded",
	style = "minimal",
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- Use a sharp border with `FloatBorder` highlights
	border = "rounded",
	style = "minimal",
	-- add the title in hover float window
	title = "hover",

	focusable = false,
})
vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = "●",
	},
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
	},
})

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_install = false,
})
require("mason-lspconfig").setup_handlers({
	function(server_name)
		lsp[server_name].setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,

	["tsserver"] = function()
		-- Typescript
		lsp.tsserver.setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["tsserver"] = {
					completion = {
						enable = true,
						showWord = "Disable",
						-- keywordSnippet = 'Disable',
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = { os.getenv("VIMRUNTIME") },
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,

	["gopls"] = function()
		lsp.gopls.setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "goword", "gotmpl" },
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
          analyses = {
            unusedparams = true,
          }
				},
			},
		})
	end,

	["rust_analyzer"] = function()
		-- Rust
		lsp.rust_analyzer.setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
					checkOnSave = {
						allFeatures = false,
						command = "clippy",
					},
					procMacro = {
						ignored = {
							["async-trait"] = { "async_trait" },
							["napi-derive"] = { "napi" },
							["async-recursion"] = { "async_recursion" },
						},
					},
				},
			},
		})
	end,

	["lua_ls"] = function()
		-- Lua
		lsp.lua_ls.setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					completion = {
						enable = true,
						showWord = "Disable",
						-- keywordSnippet = 'Disable',
					},
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = { os.getenv("VIMRUNTIME") },
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,

	["eslint"] = function()
		-- Eslint
		lsp.eslint.setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = function(_, buf)
				U.mappings(buf)
			end,
			settings = {
				useESLintClass = true, -- Recommended for eslint >= 7
				run = "onSave", -- Run `eslint` after save
			},
			-- NOTE: `root_dir` is required to fix the monorepo issue
			root_dir = require("lspconfig.util").find_git_ancestor,
		})
	end,

	["yamlls"] = function()
		lsp.yamlls.setup({
			flags = flags,
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				yaml = {
					hover = true,
					format = {
						enable = true,
						singleQuote = true,
					},
					completion = true,
					validate = true,
					customTags = {
						"!Ref scalar",
						"!Sub scalar",
						"!ImportValue scalar",
						"!GetAtt scalar",
						"!GetAtt sequence",
						"!Join sequence",
						"!Select sequence",
						"!Split sequence",
						"!GetAtt",
						"!Ref",
					},
				},
			},
		})
	end,
})
