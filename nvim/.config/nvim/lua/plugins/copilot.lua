vim.api.nvim_set_hl(0, "CopilotIcon", {
	link = "lualine_c_copilot_enabled_normal",
})

local file_glob = {
	group = "copilot",
	uri = "files://glob_contents/{pattern}",
	description = "Includes the full contents of every file matching a specified glob pattern.",
	schema = {
		type = "object",
		required = { "pattern" },
		properties = {
			pattern = {
				type = "string",
				description = "Glob pattern to match files.",
				default = "**/*",
			},
		},
	},
	resolve = function(input, source)
		local files = require("CopilotChat.utils.files").glob(source.cwd(), {
			pattern = input.pattern,
		})

		local resources = {}
		for _, file_path in ipairs(files) do
			local data, mimetype = require("CopilotChat.resources").get_file(file_path)
			if data then
				table.insert(resources, {
					uri = "file://" .. file_path,
					name = file_path,
					mimetype = mimetype,
					data = data,
				})
			end
		end

		return resources
	end,
}

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<a-f>",
					accept_word = "<a-w>",
					accept_line = "<a-l>",
				},
			},
			filetypes = {
				markdown = true,
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		command = "CopilotChat",
		build = "make tiktoken",
		keys = {
			{ "<leader>cc", "<Cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
			{ "<leader>cm", "<Cmd>CopilotChatModels<CR>", desc = "Select Copilot Chat Model" },
			{ "<leader>co", "<Cmd>CopilotChatOptimize<CR>", mode = "v", desc = "Optimize using Copilot Chat" },
			{ "<leader>ce", "<Cmd>CopilotChatExplain<CR>", mode = "v", desc = "Explain code using Copilot Chat" },
			{ "<leader>cf", "<Cmd>CopilotChatFix<CR>", mode = "v", desc = "Fix code using Copilot Chat" },
			{ "<leader>ct", "<Cmd>CopilotChatTests<CR>", mode = "v", desc = "Generate tests using Copilot Chat" },
			{ "<leader>cr", "<Cmd>CopilotChatRefactor<CR>", mode = "v", desc = "Refactor code using Copilot Chat" },
		},
		opts = {
			model = "gpt-4.1",
			temperature = 0.1,
			window = {
				layout = "vertical",
				width = 0.5,
			},
			auto_insert_mode = true,
			functions = {
				fglob = file_glob,
			},
		},
	},
}
