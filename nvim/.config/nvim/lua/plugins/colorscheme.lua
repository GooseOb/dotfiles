return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	init = function()
		local kanagawa = require("kanagawa")

		local no_bold_italic = {
			italic = false,
			bold   = false,
		}

		local highlights = {}

		for k, v in pairs(require("kanagawa.highlights").setup(
			require("kanagawa.colors").setup({ theme = "wave" }),
			kanagawa.config
		)) do
			if (v.italic or v.bold) then
				highlights[k] = no_bold_italic
			end
		end

		highlights.TabLineFill = { bg = "none" }

		kanagawa.setup({
			compile = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			transparent = true,
			overrides = function()
				return highlights
			end

		})
		kanagawa.load("wave")
	end,
}
