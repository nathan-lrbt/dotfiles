return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  dependencies = { "nvim-lualine/lualine.nvim" },
  config = function()
    vim.cmd.colorscheme("catppuccin-mocha")
    require('lualine').setup({
      options = { theme = "catppuccin-mocha" }
    })
  end,
}
