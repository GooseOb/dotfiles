vim.api.nvim_set_hl(0, "CopilotIcon", {
	link = "lualine_c_copilot_enabled_normal",
})

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
		},
		filetypes = {
			markdown = true,
		},
	},
}
