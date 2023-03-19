
local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  code_action = {
    num_shortcut = true,
    keys = {
      quit = 'q',
      exec = '<CR>',
    },
  },
  lightbulb = {
    enable = true,
  },
  symbol_in_winbar = {
    enable = true,
  },
})
