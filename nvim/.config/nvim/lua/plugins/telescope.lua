return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	cmd = "Telescope",
	keys = {
		{
			"<leader>/",
			":Telescope resume<CR>",
			desc = "Resume previous picker",
		},
		{
			"<leader>.",
			":Telescope find_files<CR>",
			desc = "Find files",
		},
		{
			"<leader>w",
			":Telescope live_grep<CR>",
			desc = "Find text in files",
		},
		{
			"<leader>fh",
			":Telescope help_tags<CR>",
			desc = "Find help",
		},
		{
			"<leader>gb",
			":Telescope git_branches<CR>",
			desc = "Git branches",
		},
		{
			"<leader>gc",
			":Telescope git_commits<CR>",
			desc = "Git commits",
		},
		{
			"<leader>gs",
			":Telescope git_status<CR>",
			desc = "Git status",
		},
		{
			"<leader>ls",
			":Telescope lsp_document_symbols<CR>",
			desc = "LSP document symbols",
		},
		{
			"gr",
			":Telescope lsp_references<CR>",
			desc = "LSP references",
		},
		{
			"gd",
			":Telescope lsp_definitions<CR>",
			desc = "LSP definitions",
		},
		{
			"<leader><Tab>",
			":Telescope buffers<CR>",
			desc = "List open buffers",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
	init = function()
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("fzf")
	end,
}
