local M = {}

function M.get(cp)
	return {
		TelescopeBorder = { fg = cp.astral0 },
		TelescopeSelectionCaret = { fg = cp.red },
		TelescopeSelection = { fg = cp.astal1, bg = cp.space3 },
		TelescopeMatching = { fg = cp.yellow },
	}
end

return M
