require("material").setup({
	contrast = {
		terminal = true,
		sidebars = true,
		floating_windows = true,
		cursor_line = true,
		non_current_windows = true
	},
	
	styles = {
		comments = { italic = true }
	},

	disable = {
		borders = true,
		eob_lines = true
	},

	high_visibility = {
		darker = true
	},

	custom_highlights = {
		[ "ColorColumn" ] = function(colors, _) return {
			bg = colors.editor.bg_alt
		} end,

		[ "CursorLine" ] = function(colors, _) return {
			bg = colors.editor.contrast,
			bold = true
		} end,

		[ "Directory" ] = function(colors, _) return {
			fg = colors.main.purple,
			bold = true
		} end,

		[ "@lsp.type.namespace.cpp" ] = function(colors, _) return {
			fg = colors.main.yellow
		} end,

		[ "@lsp.typemod.variable.readonly.cpp" ] = function(colors, _) return {
			fg = colors.editor.fg_dark
		} end,

		[ "@variable.parameter.cpp" ] = function(colors, _) return {
			fg = colors.editor.fg_dark
		} end,
		[ "@keyword.import.cpp" ] = function(colors, _) return {
			fg = colors.main.purple
		} end,
		[ "@keyword.directive" ] = function(colors, _) return {
			fg = colors.main.purple
		} end
	}
})

vim.cmd("colorscheme material")
