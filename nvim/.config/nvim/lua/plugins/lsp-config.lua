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
          "jdtls",
          "jsonls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Add this after the capabilities line and before the servers loop
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				max_width = 80,
				wrap = true,
			})

			local servers = {
				"lua_ls",
				"biome",
				"ts_ls",
				"pyright",
				"bashls",
				"sqlls",
				"rust_analyzer",
				"ltex",
				"html",
				"templ",
				"dockerls",
				"cssls",
				"clangd",
				"gopls",
				"jdtls",
        "jsonls",
			}
			for _, srv in ipairs(servers) do
				vim.lsp.config(srv, {
					capabilities = capabilities,
				})
			end

			vim.lsp.enable(servers)
			vim.lsp.config("ltex", {
				cmd_env = {
					JAVA_TOOL_OPTIONS = "-Djdk.xml.totalEntitySizeLimit=0 -Djdk.xml.entityExpansionLimit=0",
				},
				settings = {
					ltex = {
						language = "fr-FR",
					},
				},
			})
			vim.lsp.config("jsonls", {
				filetypes = { "json", "jsonc" },
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
