return {
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities.offsetEncoding = { "utf-16" }
  -- require("lspconfig").clangd.setup({ capabilities = capabilities })
  -- add clangd to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    -- opts = {
    --   ---@type lspconfig.options
    --   servers = {
    --     -- pyright will be automatically installed with mason and loaded with lspconfig
    --     clangd = {
    --       capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities().offsetEncoding = {"utf-16"}),
    --     },
    --   },
    -- },
    opts = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { "utf-16" }
      require("lspconfig").clangd.setup({ capabilities = capabilities })
    end,
  },
}
