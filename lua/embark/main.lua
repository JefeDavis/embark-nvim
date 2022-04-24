local M = {}

local utils = require("embark.utils.util")

local function load()
	local embark = require("embark")

	if embark.before_loading ~= nil then
		embark.before_loading()
	end

	-- colorscheme gets evaluated from mapper.lua
	local theme = require("embark.core.mapper").apply()
	utils.load(theme)

	if embark.after_loading ~= nil then
		embark.after_loading()
	end
end

local function clear()
	vim.cmd("hi clear")
end

function M.main(option)
	option = option or "load"

	if option == "load" then
		load()
	elseif option == "clear" then
		clear()
	else
		print("embark: option was not recognized")
	end
end

return M


