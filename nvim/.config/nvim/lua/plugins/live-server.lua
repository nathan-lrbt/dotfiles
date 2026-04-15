return {
    "barrett-ruth/live-server.nvim",
    build = "npm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = function()
        vim.g.live_server = {
            port = 5555,
            no_browser = true,
        }
    end,
}
