-- This loads on_attach, on_init, and capabilities from NvChad
local nvchad_config = require("nvchad.configs.lspconfig")

-- Configure gopls using vim.lsp.config (Neovim 0.11+)
vim.lsp.config.gopls = {
  on_attach = function(client, bufnr)
    if nvchad_config.on_attach then
      nvchad_config.on_attach(client, bufnr)
    end
  end,
  on_init = nvchad_config.on_init,
  capabilities = nvchad_config.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- Configure other LSP servers
vim.lsp.config.html = {
  on_attach = nvchad_config.on_attach,
  on_init = nvchad_config.on_init,
  capabilities = nvchad_config.capabilities,
  filetypes = { "html" },
}

vim.lsp.config.cssls = {
  on_attach = nvchad_config.on_attach,
  on_init = nvchad_config.on_init,
  capabilities = nvchad_config.capabilities,
  filetypes = { "css", "scss", "less" },
}

vim.lsp.config.ts_ls = {
  on_attach = nvchad_config.on_attach,
  on_init = nvchad_config.on_init,
  capabilities = nvchad_config.capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

vim.lsp.config.pyright = {
  on_attach = nvchad_config.on_attach,
  on_init = nvchad_config.on_init,
  capabilities = nvchad_config.capabilities,
  filetypes = { "python" },
}

vim.lsp.config.rust_analyzer = {
  on_attach = nvchad_config.on_attach,
  on_init = nvchad_config.on_init,
  capabilities = nvchad_config.capabilities,
  filetypes = { "rust" },
}

-- Enable all configured servers
vim.lsp.enable({ "gopls", "html", "cssls", "ts_ls", "pyright", "rust_analyzer" })

-- autoformats on write for go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    -- Wait for gopls to be attached
    local clients = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })
    if #clients == 0 then
      return
    end
    
    -- Organize imports
    local params = vim.lsp.util.make_range_params(nil, clients[1].offset_encoding)
    params.context = { only = { "source.organizeImports" } }
    
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    if result then
      for cid, res in pairs(result) do
        if res.result then
          for _, r in pairs(res.result) do
            if r.edit then
              local client = vim.lsp.get_client_by_id(cid)
              local enc = client and client.offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
      end
    end
    
    -- Format the buffer
    vim.lsp.buf.format({ async = false })
  end
})
