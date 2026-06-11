local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
  { src = gh("rebelot/kanagawa.nvim") },
  { src = gh("MikeWelsh801/eye-cancer") },
  { src = gh("folke/snacks.nvim") },
  { src = gh("stevearc/oil.nvim") },
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("mason-org/mason.nvim") },
  { src = gh('rafamadriz/friendly-snippets') },
  { src = gh('L3MON4D3/LuaSnip') },
  { src = gh('saghen/blink.cmp'), version = vim.version.range("^1") },
  { src = gh('tpope/vim-fugitive') },
})

require("blink.cmp").setup({
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
  -- 'enter' for enter to accept
  -- 'none' for no mappings
  --
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  --
  -- See :h blink-cmp-config-keymap for defining your own keymap
  --
  keymap = {
    preset = 'super-tab',
    ['<Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      'fallback'
    },
    ['<S-Tab>'] = { 'fallback' },
    ['<C-l>'] = { 'snippet_forward', 'fallback' },
    ['<C-h>'] = { 'snippet_backward', 'fallback' },
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono'
  },
  snippets = {
    preset = 'luasnip', -- default, luasnip, mini_snippets
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = { documentation = { auto_show = true } },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = "prefer_rust_with_warning" }
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
vim.g.mapleader = ' '
local map = vim.keymap.set
map("n", "<leader>pf", function() Snacks.picker.files() end, { desc = "Smart Find Files" })
map("n", "<leader>ff", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "Find Config File" })
map("n", "<leader>td", function() Snacks.picker.todo_comments() end, { desc = "Todo" })
map("n", "<leader>km", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
map("n", "<C-p>", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })
map("n", "tt", function() Snacks.picker.explorer() end, { desc = "Explorer" })
map("n", "<leader>gs", ":Git<Cr>")
