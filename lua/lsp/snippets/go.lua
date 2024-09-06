local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
-- local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep

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
 * description - {}{}{}
 */
func{} {}({}){} {{
  {}
}}
  ]],
		{
			i(1, "add a function description"),
			d(2, function(arg)
				-- split the string of arguments by the delimiter
				local args = vim.split(arg[1][1], ",")

				local format = "\n"
				local nodes = {}

				for index = 1, #args do
					if args[index] == "" then
						break
					end

					format = format .. "\n{}"
					table.insert(nodes, t(" * @param - " .. string.gsub(args[index], "^%s*(.-)%s*$", "%1")))
				end

				return sn(1, fmt(format, nodes))
			end, 6),
			d(3, function(arg)
				if arg[1][1] == "" then
					return sn(1, { t("") })
				end
				return sn(1, fmt("\n\n{}* @returns -{}", { t(" "), t(arg[1][1]) }))
			end, 7),
			c(4, {
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
			i(5, "name"),
			i(6, ""),
			i(7, ""),
			i(0, "// TODO - implementation"),
		}
	)
)

return snippets, autosnippets
