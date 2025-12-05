return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
	},
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	opts = {
		servers = require("plugins.lsp.servers"),
	},
	config = function(_, opts)
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			if next(config) then
				vim.lsp.config(server, config)
			end
			vim.lsp.enable(server)
		end

		require("plugins.lsp.mappings")
	end,
}
