return {
	"barrett-ruth/live-server.nvim",
	build = "npm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = function()
    vim.g.live_server({
			args = { "--host=0.0.0.0", "--port=5555", "--no-browser" },
			host = "0.0.0.0",
			port = 5555,
		})
	end,
}
