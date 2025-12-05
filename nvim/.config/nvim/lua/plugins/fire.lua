return {
	"glacambre/firenvim",
	enabled = vim.g.started_by_firenvim == true,
	lazy = false,
	build = ":call firenvim#install(0)",
	init = function()
		vim.g.firenvim_config = {
			localSettings = {
				[".*"] = {
					takeover = "never",
				},
			},
		}
		vim.opt.guifont = "JetBrainsMono Nerd Font"
		vim.api.nvim_set_keymap("n", "<a-x>", "<Cmd>call firenvim#hide_frame()<CR>", {})
	end,
}
