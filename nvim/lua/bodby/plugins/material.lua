return {
    contrast = {
        terminal = true,
        sidebars = true,
        floating_windows = true,
        cursor_line = true,
        non_current_windows = false,
    },

    styles = {
        comments = { italic = true }
    },

    plugins = {
        "nvim-cmp",
        "telescope",
    },

    disable = {
        borders = true,
        colored_cursor = false,
        eob_lines = true,
        background = true,
    },

    custom_highlights = {
        [ "StatusLine" ] = function(colors, _) return {
            -- bg = "#080808",
        } end,
        [ "StatusLineNC" ] = function(colors, _) return {
            -- bg = "#080808",
        } end,

        [ "CursorLine" ] = function(colors, _) return {} end,

        [ "Cursor" ] = function(colors, _) return {
            bg = colors.editor.cursor,
        } end,

        [ "BgAlt2" ] = function(colors, _) return {
            fg = "#888888",
        } end,

        [ "MarkviewInlineCode" ] = function(colors, _) return {
            fg = "#bbbbbb",
            bg = "#212121",
        } end,

        [ "Title" ] = function(colors, _) return {
            fg = "#dddddd",
            bold = true,
        } end,

        [ "@markup.heading" ] = function(colors, _) return {
            fg = "#dddddd",
        } end,

        [ "Identifier" ] = function(colors, _) return {
            fg = colors.editor.fg,
        } end,

        [ "Property" ] = function(colors, _) return {
            fg = colors.editor.fg_alt,
        } end,

        [ "@property" ] = function(colors, _) return {
            fg = colors.editor.fg_alt,
        } end,

        [ "Keyword" ] = function(colors, _) return {
            fg = colors.main.purple,
        } end,

        [ "@keyword" ] = function(colors, _) return {
            fg = colors.main.purple,
        } end,

        [ "Exception" ] = function(colors, _) return {
            fg = colors.main.purple,
        } end,

        [ "@keyword.function.lua" ] = function(colors, _) return {
            fg = colors.main.blue,
        } end,

        [ "ColorColumn" ] = function(colors, _) return {
            bg = "#080808",
        } end,

        [ "StatusLineNormal" ] = function(colors, _) return {
            -- bg = "#080808",
            fg = colors.main.cyan,
        } end,

        [ "StatusLineVisual" ] = function(colors, _) return {
            -- fg = colors.main.green,
            fg = colors.main.green,
        } end,

        [ "StatusLineInsert" ] = function(colors, _) return {
            fg = colors.main.purple,
        } end,

        [ "StatusLineReplace" ] = function(colors, _) return {
            -- fg = colors.main.blue,
            fg = colors.main.blue,
        } end,

        [ "StatusLineCommand" ] = function(colors, _) return {
            -- fg = colors.main.orange,
            fg = colors.main.orange,
        } end,

        [ "StatusLineModified" ] = function(colors, _) return {
            fg = colors.main.orange,
            -- bg = "#080808",
        } end,

        [ "StatusLineBracket" ] = function(colors, _) return {
            fg = colors.main.cyan,
            -- bg = "#080808",
        } end,

        [ "StatusLineMacro" ] = function(colors, _) return {
            fg = colors.main.blue,
            -- bg = "#080808",
        } end,

        [ "StatusLinePos" ] = function(colors, _) return {
            fg = colors.editor.fg_alt,
            -- bg = "#080808",
        } end,

        [ "StatusLinePath" ] = function(colors, _) return {
            fg = colors.editor.fg,
            -- bg = "#080808",
        } end,

        [ "StatusLineTime" ] = function(colors, _) return {
            fg = colors.main.blue,
        } end,

        [ "WinSeparator" ] = function(colors, _) return {
            fg = colors.editor.bg_alt,
        } end,

        [ "SnippetTabstop" ] = function(colors, _) return {
            fg = colors.editor.fg_dark,
            italic = true,
        } end,
    },

    custom_colors = function(colors)
        colors.editor.fg = "#bbbbbb"
        colors.editor.fg_alt = "#888888"
        colors.editor.bg = "#101010"
        colors.editor.bg_alt = "#101010"
        colors.editor.border = "#212121"
        colors.editor.contrast = "#080808"
        colors.syntax.comments = "#515151"
        colors.editor.accent = "#dddddd"
        colors.editor.cursor = "#2a2a2a"
    end,
}
