require("core.mappings")
require("core.plugins")
require("core.configs")
require("core.typo")

-- Respect Emacs-style file variables
vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = "*",
	callback = function()
		local mode = vim.fn.getline(1):match("%-%*-%s*mode:%s*([%w_]+)%s*%-%*-")
		if mode then
			vim.bo.filetype = mode
		end
	end,
})
