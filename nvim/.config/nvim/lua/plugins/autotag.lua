return {
	"windwp/nvim-ts-autotag",
	event = "BufReadPost",
	config = function()
		require("nvim-ts-autotag").setup()
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = {
				underline = true,
				virtual_text = { spacing = 5 },
				spacing = 5,
				severity_sort = true,
			},
			update_in_insert = true,
		})
	end,
}
