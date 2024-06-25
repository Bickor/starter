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

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tav

-- tmux-navigator
unmap("n", "<C-h>")
unmap("n", "<C-l>")
unmap("n", "<C-j>")
unmap("n", "<C-k>")

map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = ""})
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = ""})
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = ""})
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = ""})

-- nvimtree
unmap("n", "<C-n>")
unmap("n", "<leader>e")

map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Open/Close the nvim tree" })
map("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on the nvim tree" })
