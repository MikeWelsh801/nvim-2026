local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
  { src = gh("rebelot/kanagawa.nvim") },
  { src = gh("MikeWelsh801/eye-cancer") },
  { src = gh("folke/snacks.nvim") },
  { src = gh("stevearc/oil.nvim") },
  { src = gh("/neovim/nvim-lspconfig") },
  { src = gh("mason-org/mason.nvim") },
})

require('oil').setup()
require('mason').setup()

local Snacks = require("snacks")
Snacks.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  bigfile = { enabled = true },
  explorer = { enabled = true },
  -- input = { enabled = true },
  image = { enabled = true },
  picker = { enabled = true },
  quickfile = { enabled = true },
  -- scroll = { enabled = true },
})

-- Keymaps must be registered manually (the `keys` field was a lazy.nvim feature).
local map = vim.keymap.set
map("n", "<leader>pf", function() Snacks.picker.files() end,                                   { desc = "Smart Find Files" })
map("n", "<leader>ff", function() Snacks.picker.smart() end,                                   { desc = "Smart Find Files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end,                                    { desc = "Grep" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
map("n", "<leader>td", function() Snacks.picker.todo_comments() end,                           { desc = "Todo" })
map("n", "<leader>km", function() Snacks.picker.keymaps() end,                                 { desc = "Keymaps" })
map("n", "<C-p>",      function() Snacks.picker.git_files() end,                               { desc = "Find Git Files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end,                                  { desc = "Recent" })
map("n", "tt",         function() Snacks.picker.explorer() end,                                { desc = "Explorer" })
