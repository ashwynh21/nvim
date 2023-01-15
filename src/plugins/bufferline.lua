
vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    mode = 'buffers',
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    color_icons = true,
    diagnostics = 'nvim_lsp'
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#073642',
    },
    separator_selected = {
      fg = '#275662',
    },
    background = {
      fg = '#766583',
      bg = '#212838'
    },
    buffer_selected = {
      fg = '#fdf6f3',
    },
    fill = {
      bg = '#1f243a'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
