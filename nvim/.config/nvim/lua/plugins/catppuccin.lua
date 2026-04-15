return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  dependencies = { "nvim-lualine/lualine.nvim" },
  config = function()
    vim.cmd.colorscheme("catppuccin")
    require('lualine').setup({
      options = { theme = "catppuccin" }
    })
  end,
}
