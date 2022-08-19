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
end

-- Configuring native diagnostics
vim.diagnostic.config({
	virtual_text = {
		source = "always",
	},
	float = {
		source = "always",
	},
})

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_install = false,
})
require("mason-lspconfig").setup_handlers({
  function (server_name)
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
				  allFeatures = true,
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

  ["sumneko_lua"] = function()
  -- Lua
  lsp.sumneko_lua.setup({
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
  end
})


