local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts)
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet)
end

cs(
	"test",
	fmt(
		[[
func {}(t *testing.T) {{
  // setup

  // act

  // assert
}}
  ]],
		{
			i(1, "name"),
		}
	),
	"gtf"
)
cs(
	"func",
	fmt(
		[[
/**
 * description - {}
 * {}
 * @returns - {}
*/
func{} {}({}) {} {{
  {}
}}
  ]],
		{
			i(1, "add a function description"),
			d(1, function(arg)
				print(vim.inspect(arg))
				-- split the string of arguments by the delimiter
				local args = vim.split(arg[1][1], ",")

				local format = "{}"
				local nodes = { t("") }

				for index = 1, #args do
					if args[index] == "" then
						return sn(1, { t("") })
					end

					format = format .. "\n{}"
					table.insert(nodes, t(" * @param - " .. args[index]))
				end

				return sn(1, fmt(format, nodes))
			end, 4),
			rep(5),
			c(2, {
				-- or a func that is independent
				t(""),
				-- offer func that is attached to a struct type
				sn(
					1,
					fmt(
						[[
 ({} *{})
        ]],
						{
							i(1, "name"),
							i(2, "type"),
						}
					)
				),
			}),
			i(3, "name"),
			i(4, ""),
			i(5, ""),
			i(6, "// TODO - implementation"),
		}
	)
)

return snippets, autosnippets
