local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- [[ My Keys ]]
map("n", "<C-s>", ":w<CR>")
map("n", "<C-q>", ":q<CR>")

-- [[ Nvim Tree ]]
map("n", "<leader>t", ":NvimTreeFocus<CR>")

-- Move to the next/previous buffer
map("n", "<leader>[", ":bp<CR>")
map("n", "<leader>]", ":bn<CR>")
