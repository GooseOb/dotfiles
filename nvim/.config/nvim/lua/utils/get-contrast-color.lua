return function(hex)
	local luminance = (
		0.299 * tonumber(hex:sub(2, 3), 16)
		+ 0.587 * tonumber(hex:sub(4, 5), 16)
		+ 0.114 * tonumber(hex:sub(6, 7), 16)
	) / 255

	return luminance > 0.5 and "#000000" or "#FFFFFF"
end
