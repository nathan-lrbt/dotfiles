return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "bashls",
          "sqlls",
          "rust_analyzer",
          "ltex",
          "htmx",
          "templ",
          "dockerls",
          "cssls",
          "html",
          "clangd",
          "gopls",
          "biome",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = { "lua_ls", "biome", "ts_ls", "pyright", "bashls", "sqlls", "rust_analyzer", "ltex", "html", "templ", "dockerls", "cssls", "clangd", "gopls"}
      for _, srv in ipairs(servers) do
        vim.lsp.config(srv, {
          capabilities = capabilities,
        })
      end

      vim.lsp.enable(servers)
      vim.lsp.config("gopls", {
        filetypes = { "json", "jsonc" },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
