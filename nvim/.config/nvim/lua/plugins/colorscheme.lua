return {
	{
		dir = os.getenv("HOME") .. "/.config/nvim/plugins/gruber-darker.nvim",
		-- "gooseob/gruber-darker.nvim",
		opts = {
			transparent = true,
			-- terminalColors = true,
			bold = false,
			italic = false,
		},
		init = function()
			require("gruber-darker").load()
		end,
	},
}
