return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").add({
			{ "<leader>e", desc = "File Manager" },
			{ "<leader>h", desc = "No highlight" },
			{ "<leader>o", desc = "Git Status" },
			{ "<leader>w", desc = "Save" },
			{ "<leader>q", desc = "Close Current Buffer" },
			{ "<leader>b", desc = "Pick Buffer" },
			{ "<leader>x", desc = "Pick Buffer to Close" },

			{ "<leader>f", group = "Find" },
			{ "<leader>fb", desc = "Find Buffer" },
			{ "<leader>ff", desc = "Find File" },
			{ "<leader>fh", desc = "Find Help" },
			{ "<leader>fw", desc = "Find Text" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gb", desc = "Branches" },
			{ "<leader>gc", desc = "Commits" },
			{ "<leader>gs", desc = "Status" },

			{ "<leader>l", group = "LSP" },
			{ "<leader>D", desc = "Hover diagnostic" },
			{ "<leader>d", desc = "Diagnostic" },
			{ "<leader>r", desc = "Rename" },
			{ "<leader>lf", desc = "Format" },
			{ "<leader>ls", desc = "Symbol" },
		}, { prefix = "<leader>" })
	end,
}
