return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	keys = {
		{ "<leader>H", ":Gitsigns preview_hunk_inline<CR>" },
		{ "<leader>t", ":Gitsigns reset_hunk<CR>" },
		{ "<leader>T", ":Gitsigns reset_buffer<CR>" },
		{ "<leader>s", ":Gitsigns stage_hunk<CR>" },
		{ "<leader>S", ":Gitsigns stage_buffer<CR>" },
	},
	config = true,
}
