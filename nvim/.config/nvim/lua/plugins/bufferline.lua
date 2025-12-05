local get_contrast_color = require("utils.get-contrast-color")

local border_component = function(char, do_fill)
	local space = string.rep(" ", vim.fn.strdisplaywidth(char))
	return {
		text = function(buffer)
			return buffer.is_focused and char or space
		end,
		bg = function(buffer)
			return buffer.is_focused and do_fill(buffer) and buffer.devicon.color or "None"
		end,
		fg = function(buffer)
			return buffer.devicon.color
		end,
	}
end

local is_picking = false
local picking = function(what)
	return function()
		is_picking = true
		require("cokeline.mappings").pick(what)
		is_picking = false
	end
end

local buf_name = function(buffer)
	local value = buffer.unique_prefix
		.. buffer.filename
		.. (buffer.is_modified and " 󰙏 " or buffer.is_readonly and "  " or " ")

	return is_picking and value:sub(2) or value
end

return {
	"willothy/nvim-cokeline",
	event = "BufReadPre",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<s-Tab>", "<Plug>(cokeline-focus-prev)" },
		{ "<Tab>", "<Plug>(cokeline-focus-next)" },
		{ "<leader>q", ":bp | bd #<CR>" },
		{ "<leader>b", picking("focus") },
		{ "<leader>x", picking("close") },
	},
	opts = {
		show_if_buffers_are_at_least = 2,
		default_hl = {
			bg = function(buffer)
				return buffer.is_focused and buffer.devicon.color or "None"
			end,
		},
		fill_hl = "Normal",
		components = {
			border_component("", function(buffer)
				return buffer.is_first
			end),
			{
				text = function(buffer)
					return buffer.devicon.icon .. " "
				end,
				fg = function(buffer)
					return buffer.is_focused and get_contrast_color(buffer.devicon.color) or buffer.devicon.color
				end,
			},
			{
				text = function(buffer)
					return is_picking and buffer.pick_letter or ""
				end,
				fg = "#000000",
				bg = "#FF0000",
			},
			{
				text = buf_name,
				fg = function(buffer)
					return buffer.is_focused and get_contrast_color(buffer.devicon.color)
						or buffer.is_modified and "#FFAA00"
						or "#AAAAAA"
				end,
			},
			border_component("", function(buffer)
				if buffer.is_last then
					local len = 0
					for _, buf in ipairs(require("cokeline.buffers").get_visible()) do
						-- 5 = 2@border + 3@icon
						len = len + vim.fn.strdisplaywidth(buf_name(buf)) + (is_picking and 6 or 5)
					end
					return len >= vim.o.columns
				else
					return false
				end
			end),
		},
	},
}
