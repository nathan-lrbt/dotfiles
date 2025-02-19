return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.defaults.fallback.external_terminal = {
      command = "/usr/bin/ghostty", -- Or another terminal like "konsole", "xterm", "alacritty"
      args = { "--" },
    }

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/home/nathan/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }
    require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "h" } })

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end,
}
