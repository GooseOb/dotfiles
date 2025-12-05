return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = "BufReadPost",
	config = function()
		require("conform").setup({
			formatters_by_ft = require("utils.swap").merge({
				lua = { "stylua" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
			}, {
				black = {
					"python",
				},
				prettierd = {
					"css",
					"vue",
					"svelte",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"scss",
					"less",
					"html",
					"json",
					"jsonc",
					"yaml",
					"markdown",
					"markdown.mdx",
					"graphql",
					"handlebars",
				},
				shfmt = {
					"sh",
					"zsh",
					"bash",
				},
			}),

			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "prefer",
			},
		})
	end,
}
