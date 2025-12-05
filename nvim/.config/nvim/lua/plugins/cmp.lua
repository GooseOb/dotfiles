return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
						require("luasnip.loaders.from_vscode").lazy_load({
							paths = { vim.fn.stdpath("config") .. "/snippets" },
						})
					end,
				},
			},
			opts = {
				history = true,
				delete_check_events = "TextChanged",
			},
		},
	},

	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		enabled = function()
			if vim.api.nvim_win_get_config(0).relative ~= "" then
				return false
			end
			return true
		end,
		keymap = {
			preset = "default",
			["<Up>"] = { "select_prev", "fallback" },
			["<s-Tab>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},

		snippets = {
			preset = "luasnip",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		cmdline = {
			enabled = false,
		},
		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			menu = {
				auto_show = function()
					return vim.bo.buftype ~= "prompt"
						and vim.b.completion ~= false
						and vim.bo.filetype ~= "TelescopePrompt"
				end,
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr then
										icon = color_item.abbr
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local group = "BlinkCmpKind" .. ctx.kind
								if ctx.item.source_name == "copilot" then
									group = "CopilotIcon"
								end
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr_hl_group then
										group = color_item.abbr_hl_group
									end
								end
								return group
							end,
						},
					},
				},
			},
		},
	},
	init = function()
		vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
			link = "Normal",
		})
	end,
	opts_extend = { "sources.default" },
}
