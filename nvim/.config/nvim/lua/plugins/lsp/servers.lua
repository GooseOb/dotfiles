local data_path = vim.fn.stdpath("data")
local mason_packages_path = data_path .. "/mason/packages"

return {
	tinymist = {
		settings = {
			formatterMode = "typstyle",
			exportPdf = "disable",
			semanticTokens = "disable",
		},
	},
	biome = {
		filetypes = {
			"astro",
			"css",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"typescript",
			"typescript.tsx",
			"typescriptreact",
			"vue"
		},
	},
	ts_ls = {
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	},
	cssls = {},
	clangd = {},
	emmet_ls = {},
	svelte = {},
	tailwindcss = {},
	jsonls = {
		settings = {
			json = {
				schemas = {
					{
						fileMatch = { "tsconfig.json" },
						url = "https://json.schemastore.org/tsconfig",
					},
				},
				validate = { enable = false },
			},
		},
	},
	jdtls = {
		cmd = {
			"jdtls",
			"-data",
			data_path .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
			"--jvm-arg=-javaagent:" .. mason_packages_path .. "/jdtls/lombok.jar",
		},
	},
	html = {},
	basedpyright = {
		settings = {
			basedpyright = {
				typeCheckingMode = "off",
			},
		},
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					enable = true,
					experimental = {
						enable = true,
					},
				},
			},
		},
	},
	bashls = {
		filetypes = { "sh", "bash", "zsh" },
	},
	lua_ls = {
		settings = {
			Lua = {
				telemetry = {
					enable = false,
				},
				diagnostics = {
					globals = {
						"vim",
					},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
			},
		},
	},
	vue_ls = {
		filetypes = {
			"vue",
		},
		init_options = {
			typescript = {
				tsdk = mason_packages_path .. "/vue-language-server/node_modules/typescript/lib",
			},
			vue = {
				hybridMode = false,
			},
		},
	},
}
