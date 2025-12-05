local M = {}

M.merge = function(target, source)
	for key, values in pairs(source) do
		for _, value in ipairs(values) do
			if target[value] == nil then
				target[value] = { key }
			else
				table.insert(target[value], key)
			end
		end
	end
	return target
end

M.new = function(source)
	return M.merge({}, source)
end

return M
