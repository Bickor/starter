require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- DAP mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus", function ()
  local widgets = require('dap.ui.widgets')
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

-- DAP Go mappings
map("n", "<leader>dgt", function()
  require('dap-go').debug_test()
end, { desc = "Debug go test" })
map("n", "<leader>dgl", function()
  require('dap-go').debug_last()
end, { desc = "Debug last go test" })

-- Telescope
local builtin = require('telescope.builtin')
unmap('n', '<leader>fw')
unmap('n', '<leader>fz')
map('n', '<leader>fg', builtin.live_grep, { desc = "telescope live grep" })
map('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = "telescope find in current buffer" })
