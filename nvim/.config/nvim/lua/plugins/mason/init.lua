return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	event = "VeryLazy",
	config = function()
		require("mason").setup()

		local mason_registry = require("mason-registry")

		for _, package in ipairs(require("plugins.mason.ensure-installed")) do
			local p = mason_registry.get_package(package)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
