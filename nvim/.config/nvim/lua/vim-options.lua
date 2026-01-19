vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.g.mapleader = " "
vim.diagnostic.config({
  virtual_text = false,  -- Disable inline messages
  float = {
    wrap = true,
    max_width = 80,
    border = "rounded",
    source = "always",
  },
})

-- Automatically show floating diagnostic window on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

-- Set the delay before the floating window appears (in milliseconds)
vim.opt.updatetime = 500
