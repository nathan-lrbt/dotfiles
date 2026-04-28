return{
  "lervag/vimtex",
  lazy = false, -- vimtex needs to load early for filetype detection
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
  end,
}
