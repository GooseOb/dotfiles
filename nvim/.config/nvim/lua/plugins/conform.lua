return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = "BufReadPost",
	config = function()
		local biome_prettier = { "biome", "prettierd", stop_after_first = true }

		require("conform").setup(
			{
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt" },
					java = { "google-java-format" },
					python = { "black" },
					astro = { "biome" },
					css = biome_prettier,
					graphql = biome_prettier,
					html = biome_prettier,
					javascript = biome_prettier,
					javascriptreact = biome_prettier,
					json = biome_prettier,
					jsonc = biome_prettier,
					typescript = biome_prettier,
					typescriptreact = biome_prettier,
					vue = biome_prettier,
					handlebars = { "prettierd" },
					less = { "prettierd" },
					markdown = { "prettierd" },
					["markdown.mdx"] = { "prettierd" },
					scss = { "prettierd" },
					svelte = { "prettierd" },
					yaml = { "prettierd" },
					bash = { "shfmt" },
					sh = { "shfmt" },
					zsh = { "shfmt" }
				},

				format_on_save = {
					timeout_ms = 1000,
				},

				formatters = {
					biome = {
						require_cwd = true,
					},
				},
			})
	end,
}
