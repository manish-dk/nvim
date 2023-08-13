require("dapui").setup()
local dapui = require("dapui")
local dap = require("dap")

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

vim.keymap.set('n', '<Leader>du', function() dapui.open() end, { desc = "Debug UI" })
vim.keymap.set('n', '<Leader>dy', function() dapui.close() end, { desc = "Close debug UI" })

vim.keymap.set('n', '<Leader>5', function() dap.continue() end, { desc = "Continue" })
vim.keymap.set('n', '<Leader>6', function() dap.step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<Leader>7', function() dap.step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<Leader>8', function() dap.step_out() end, { desc = "Step out" })
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })

