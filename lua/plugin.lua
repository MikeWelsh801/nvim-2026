local gh = function(x) return 'https://github.com/' .. x end
vim.g.mapleader = ' '
vim.pack.add({
	{ src = gh("rebelot/kanagawa.nvim")},
	{ src = gh("MikeWelsh801/eye-cancer")},
	{ src = gh("folke/snacks.nvim")},
	{ src = gh("stevearc/oil.nvim")},
})
require('oil').setup()
local Snacks = require("snacks")
Snacks.setup({
      ---@type snacks.Config
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

local map = vim.keymap.set
map("n", "<leader>pf", function() Snacks.picker.files() end)
map("n", "<leader>ff", function() Snacks.picker.smart() end)
map("n", "<leader>fg", function() Snacks.picker.grep() end)
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end)
map("n", "<leader>td", function() Snacks.picker.todo_comments() end)
map("n", "<leader>km", function() Snacks.picker.keymaps() end)
map("n", "<C-p>",      function() Snacks.picker.git_files() end)
map("n", "<leader>fr", function() Snacks.picker.recent() end)
map("n", "tt", function() Snacks.picker.explorer() end)
