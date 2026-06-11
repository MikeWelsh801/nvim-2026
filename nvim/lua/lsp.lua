vim.lsp.enable({
  "bashls",
  "clangd",
  "cmake",
  "gopls",
  "html",
  "jedi_language_server",
  "jsonls",
  "lemminx",
  "lua_ls",
  "ocamllsp",
  "qmlls",
  "ruff",
  "rust_analyzer",
  "ts_ls",
  "yamlls",
})

-- Enable native LSP completion per-buffer when the server supports it.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})
