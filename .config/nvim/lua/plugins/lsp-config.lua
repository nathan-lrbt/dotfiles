return{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", 'ts_ls', "pyright", "bashls", "sqlls", "rust_analyzer", "ltex", "htmx", "templ", "dockerls", "cssls", "clangd"}
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.ts_ls.setup({capabilities = capabilities})
      lspconfig.pyright.setup({capabilities = capabilities})
      lspconfig.bashls.setup({capabilities = capabilities})
      lspconfig.sqlls.setup({capabilities = capabilities})
      lspconfig.rust_analyzer.setup({capabilities = capabilities})
      lspconfig.ltex.setup({capabilities = capabilities})
      lspconfig.htmx.setup({capabilities = capabilities})
      lspconfig.templ.setup({capabilities = capabilities})
      lspconfig.dockerls.setup({capabilities = capabilities})
      lspconfig.cssls.setup({capabilities = capabilities})
      lspconfig.clangd.setup({capabilities = capabilities})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, {})
    end
  }
}
