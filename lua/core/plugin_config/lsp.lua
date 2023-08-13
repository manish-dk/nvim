local lsp = require('lsp-zero').preset({})
lsp.configure('omnisharp', { handlers = { ["textDocument/definition"] = require('omnisharp_extended').handler, } })
lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = "Go to declaration", buffer = ev.buffer})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = "Go to definition", buffer = ev.buffer})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = "lsp hover", buffer = ev.buffer})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc = "Go to implementation", buffer = ev.buffer})
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {desc = "signature help", buffer = ev.buffer})
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {desc = "add_workspace_folder", buffer = ev.buffer})
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {desc = "remove_workspace_folder", buffer = ev.buffer})
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, {desc = "Go to definition", buffer = ev.buffer})
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {desc = "type_definition", buffer = ev.buffer})
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {desc = "rename", buffer = ev.buffer})
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {desc = "code_action", buffer = ev.buffer})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {desc = "references", buffer = ev.buffer})
    vim.keymap.set('n', '<space>fm', function()
      vim.lsp.buf.format { async = true }
    end, {desc = "format"})
  end,
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
