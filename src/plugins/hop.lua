require('hop').setup({
  keys = 'qwerasdfzxcv'
})

vim.keymap.set('n', '<S-Down>', '<CMD>HopWordAC<CR>')
vim.keymap.set('n', '<S-Up>', '<CMD>HopWordBC<CR>')
