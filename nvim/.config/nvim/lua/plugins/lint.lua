return {
	"mfussenegger/nvim-lint",
	event = "BufRead",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = require("utils.swap").new({
			eslint_d = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
			},
		})

		lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
			if diagnostic.message:find("Error: Could not find config file") then
				return nil
			end
			return diagnostic
		end)

		vim.api.nvim_create_autocmd({ "BufRead", "TextChanged", "BufWritePost" }, {
			callback = function(arg)
				if arg.file:match("^.*/%.github/workflows/.*%.ya?ml$") then
					lint.try_lint("actionlint")
					return
				end

				lint.try_lint()
			end,
		})
	end,
}
