for correction, typos in pairs({
	["const"] = { "cosnt" },
	["function"] = { "funciton" },
	["return"] = { "retrun", "reutrn" },
	["print"] = { "pritn" },
	["true"] = { "ture" },
	["false"] = { "flase" },
	["console"] = { "cosnole", "cosnoel" },
}) do
	for _, typo in ipairs(typos) do
		vim.api.nvim_set_keymap("ia", typo, correction, { silent = true })
	end
end
