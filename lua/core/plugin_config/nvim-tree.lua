vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<Leader>ew', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<Leader>ee', ':NvimTreeFocus<CR>')
