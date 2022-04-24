local colors_util = require("embark.utils.colors")
local color_palette = require("embark.core.color_palette")

local M = {}

local function get_properties()
	local props = {
		termguicolors = true,
		background = "dark",
	}

	if colors_util.assert_brightness(color_palette.space3) then
		props["background"] = "light"
	end

	return props
end

local function get_base()
	local cp = color_palette
	cp.none = "NONE"

	return {
		Comment = { fg = cp.astral0, style = cnf.styles.comments }, -- just comments
		ColorColumn = { bg = cp.space0 }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = cp.astral1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = cp.space4, bg = cp.blue }, -- character under the cursor
		lCursor = { fg = cp.blue, bg = cp.space4 }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { fg = cp.blue, bg = cp.space4 }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = cp.space0 }, -- Screen-column at the cursor, when 'cursorcolumn' is secp.
		CursorLine = { bg = cp.space0 }, -- Screen-line at the cursor, when 'cursorline' is secp.  Low-priority if foreground (ctermfg OR guifg) is not secp.
		Directory = { fg = cp.magenta }, -- directory names (and other special names in listings)
		EndOfBuffer = { fg = cp.space4 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = cp.darkRed, style = "bold,italic" }, -- error messages on the command line
		VertSplit = { fg = cp.space0 }, -- the column separating vertically split windows
		Folded = { fg = cp.darkMagenta }, -- line used for closed folds
		FoldColumn = { fg = cp.yellow }, -- 'foldcolumn'
		SignColumn = { bg = cnf.transparent_background and cp.none or cp.black2, fg = cp.green }, -- column where |signs| are displayed
		SignColumnSB = { fg = cp.green }, -- column where |signs| are displayed
		Substitute = { bg = cp.yellow, fg = cp.space1 }, -- |:substitute| replacement text highlighting
		LineNr = { fg = cp.black4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
		CursorLineNr = { fg = cp.space4, bg = cp.space0 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
		MatchParen = { fg = cp.magenta, style = "bold", bg = cp.space0 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = cp.astral1, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = cp.astral1 }, -- Area for messages and cmdline
		MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = cp.astral1, style = "bold" }, -- |more-prompt|
		NonText = { fg = cp.space4 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = cp.astral1, bg = cnf.transparent_background and cp.none or cp.space1 }, -- normal text
		NormalNC = { fg = cp.astral1, bg = cnf.transparent_background and cp.none or cp.space1 }, -- normal text in non-current windows
		NormalSB = { fg = cp.astral1, bg = cp.space1 }, -- normal text in non-current windows
		NormalFloat = { fg = cp.astral1, bg = cp.space1 }, -- Normal text in floating windows.
		FloatBorder = { fg = cp.astral0 },
		Pmenu = { bg = cp.space2, fg = cp.astral1 }, -- Popup menu: normal item.
		PmenuSel = { fg = cp.magenta, bg = cp.space1, style = "bold" }, -- Popup menu: selected item.
		PmenuSbar = { fg = cp.astral1, bg = cp.space0 }, -- Popup menu: scrollbar.
		PmenuThumb = { fg = cp.astral1, bg = cp.space0 }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = cp.red }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = cp.space1, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = cp.darkYellow, fg = cp.space1, style = "bold" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
		IncSearch = { bg = cp.yellow, fg = cp.space1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		SpecialKey = { fg = cp.blue }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = cp.darkRed, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = cp.green, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = cp.darkGreen, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = cp.red, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = cp.astral1, bg = cp.space1 }, -- status line of current window
		StatusLineNC = { bg = cp.space1 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = cp.astral1, fg = cp.space0 }, -- tab pages line, not active tab page label
		TabLineFill = { fg = cp.astral0, bg = cp.space0 }, -- tab pages line, where there are no labels
		TabLineSel = { fg = cp.space0, bg = cp.cyan }, -- tab pages line, active tab page label
		Title = { fg = cp.darkBlue, style = "bold" }, -- titles for output from ":set all", ":autocmd" etcp.
		Visual = { bg = cp.space3, style = "bold" }, -- Visual mode selection
		VisualNOS = { bg = cp.space3, style = "bold" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = cp.yellow }, -- warning messages
		Whitespace = { fg = cp.astral0 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { fg = cp.space0, bg = cp.cyan }, -- current match in 'wildmenu' completion
		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- gray0ed out groups should chain up to their "preferred" group by
		-- default,
		-- Ungray0 and edit if you want more specific syntax highlighting.

		-- code itself

		Constant = { fg = cp.yellow }, -- (preferred) any constant
		String = { fg = cp.yellow, style = cnf.styles.strings }, -- a string constant: "this is a string"
		Character = { fg = cp.yellow }, --  a character constant: 'c', '\n'
		Number = { fg = cp.darkYellow }, --   a number constant: 234, 0xff
		Float = { fg = cp.darkYellow }, --    a floating point constant: 2.3e10
		Boolean = { fg = cp.darkYellow }, --  a boolean constant: TRUE, false
		Identifier = { fg = cp.magenta, style = cnf.styles.variables }, -- (preferred) any variable name
		Function = { fg = cp.red, style = cnf.styles.functions }, -- function name (also: methods for classes)
		Statement = { fg = cp.green }, -- (preferred) any statement
		Conditional = { fg = cp.green }, --  if, then, else, endif, switch, etcp.
		Repeat = { fg = cp.darkCyan }, --   for, do, while, etcp.
		Label = { fg = cp.darkBlue }, --    case, default, etcp.
		Operator = { fg = cp.darkCyan }, -- "sizeof", "+", "*", etcp.
		Keyword = { fg = cp.green, style = cnf.styles.keywords }, --  any other keyword
		Exception     = { fg = cp.green }, --  try, catch, throw

		PreProc = { fg = cp.green }, -- (preferred) generic Preprocessor
		Include = { fg = cp.green }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etcp.

		StorageClass = { fg = cp.blue }, -- static, register, volatile, etcp.
		Structure = { fg = cp.blue }, --  struct, union, enum, etcp.
		Typedef = { fg = cp.blue }, --  A typedef
		Special = { fg = cp.cyan }, -- (preferred) any special symbol
		Type = { fg = cp.blue }, -- (preferred) int, long, char, etcp.
		SpecialChar   = { fg = cp.cyan }, --  special character in a constant
		Tag           = { fg = cp.cyan }, --    you can use CTRL-] on this
		Delimiter     = { fg = cp.cyan }, --  character that needs attention
		-- Specialgray0= {  }, -- special things inside a gray0
		Debug         = { fg = cp.cyan}, --    debugging statements

		Underlined = { fg = cp.astral1, style = "underline" }, -- (preferred) text that stands out, HTML links
		Bold = { style = "bold" },
		Italic = { style = "italic" },
		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { fg = cp.darkRed }, -- (preferred) any erroneous construct
		Todo = { bg = cp.darkYellow, fg = cp.space1, style = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		qfLineNr = { fg = cp.yellow },
		qfFileName = { fg = cp.blue },
		htmlH1 = { fg = cp.magenta, style = "bold" },
		htmlH2 = { fg = cp.blue, style = "bold" },
		-- mkdHeading = { fg = cp.peach, style = "bold" },
		-- mkdCode = { bg = cp.terminal_black, fg = cp.white },
		mkdCodeDelimiter = { fg = cp.astral0 },
		mkdCodeStart = { fg = cp.astral0, style = "bold" },
		mkdCodeEnd = { fg = cp.astral0, style = "bold" },
		-- mkdLink = { fg = cp.blue, style = "underline" },

		-- debugging
		debugPC = { bg = cp.space0 }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = cp.space2, fg = cp.astral0 }, -- used for breakpoint colors in terminal-debug
		-- illuminate
		illuminatedWord = { bg = cp.space4 },
		illuminatedCurWord = { bg = cp.space4 },
		-- diff
		diffAdded = { fg = cp.green },
		diffRemoved = { fg = cp.red },
		diffChanged = { fg = cp.yellow },
		diffOldFile = { fg = cp.yellow },
		diffNewFile = { fg = cp.magenta },
		diffFile = { fg = cp.blue },
		diffLine = { fg = cp.astral1 },
		diffIndexLine = { fg = cp.magenta },
		DiffAdd = { fg = cp.space1, bg = cp.darkGreen}, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = cp.space1, bg = cp.darkYellow }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { fg = cp.space1, bg = cp.darkRed }, -- diff mode: Deleted line |diff.txt|
		DiffText = { fg = cp.space1, bg = cp.darkBlue }, -- diff mode: Changed text within a changed line |diff.txt|
		-- NeoVim
		healthError = { fg = cp.red },
		healthSuccess = { fg = cp.green },
		healthWarning = { fg = cp.yellow },
		-- misc

		-- glyphs
		GlyphPalette1 = { fg = cp.red },
		GlyphPalette2 = { fg = cp.cyan },
		GlyphPalette3 = { fg = cp.yellow },
		GlyphPalette4 = { fg = cp.blue },
		GlyphPalette6 = { fg = cp.cyan },
		GlyphPalette7 = { fg = cp.astral1 },
		GlyphPalette9 = { fg = cp.red },
	}
end

local function get_integrations()
	local integrations = cnf["integrations"]
	local final_integrations = {}

	for integration in pairs(integrations) do
		local cot = false
		if type(integrations[integration]) == "table" then
			if integrations[integration]["enabled"] == true then
				cot = true
			end
		else
			if integrations[integration] == true then
				cot = true
			end
		end

		if cot then
			final_integrations = vim.tbl_deep_extend(
				"force",
				final_integrations,
				require("embark.core.integrations." .. integration).get(color_palette)
			)
		end
	end

	final_integrations = vim.tbl_deep_extend(
		"force",
		final_integrations,
		require("embark.core.remaps").get_hig_remaps() or {}
	)
	return final_integrations
end

local function get_terminal()
	return color_palette
end

function M.apply()
	_G.cnf = require("embark.config").options

	local theme = {}
	theme.properties = get_properties() -- nvim settings
	theme.base = get_base() -- basic hi groups
	theme.integrations = get_integrations() -- plugins
	theme.terminal = get_terminal() -- terminal colors

	-- uninstantiate to avoid poluting global scope and because it's not needed anymore
	_G.cnf = nil

	return theme
end

return M
