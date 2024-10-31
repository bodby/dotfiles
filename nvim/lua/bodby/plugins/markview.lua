return {
    __inside_code_block = true,
    buf_ignore = { "nofile" },
    debounce = 50,
    filetypes = { "markdown", "quarto", "rmd" },
    hybrid_modes = nil,
    injections = {},
    initial_state = false,
    max_file_length = 1000,
    modes = { "n", "no", "c" },
    render_distance = 100,

    block_quotes = {
        enable = true,

        default = {
            border = "▏",

            hl = "MarkviewBlockQuoteDefault"
        },
        callouts = {
            {
                match_string = "NOTE",

                hl = "Cyan",

                preview = "Note",

                preview_hl = nil,

                title = true,

                icon = "",

                border = "▏",

                border_hl = nil
            },
            {
                match_string = "QUOTE",

                hl = "Comment",

                preview = "Quote",

                preview_hl = nil,

                title = true,

                icon = "",

                border = "▏",

                border_hl = nil
            },
        }
    },

    checkboxes = {
        enable = true,

        checked = {
            text = "x",
            hl = "MarkviewCheckboxChecked",
            scope_hl = nil
        },

        unchecked = {
            text = "-",
            hl = "MarkviewCheckboxUnchecked",
            scope_hl = nil
        },
    },

    code_blocks = {
        enable = true,
        icons = "internal",
        style = "language",
        hl = "MarkviewCode",
        info_hl = "MarkviewCodeInfo",
        min_width = 60,
        pad_amount = 1,
        pad_char = " ",

        -- e.g. { cpp = "C++" }
        -- { [string]: string }
        language_names = nil,

        language_direction = "right",

        sign = true,

        sign_hl = nil
    },

    footnotes = {
        enable = false,
    },

    headings = {
        enable = true,
        shift_width = 0,

        heading_1 = {
            style = "label",
            align = "left",

            icon = "1 ",
            hl = "Title",
            icon_hl = "BgAlt2",
        },

        heading_2 = {
            style = "label",
            align = "left",

            icon = "2 ",
            hl = "Title",
            icon_hl = "BgAlt2",
        },
        heading_3 = {
            style = "label",
            align = "left",

            icon = "3 ",
            hl = "Title",
            icon_hl = "BgAlt2",
        },
        heading_4 = {
            style = "label",
            align = "left",

            icon = "4 ",
            hl = "Title",
            icon_hl = "BgAlt2",
        },
        heading_5 = {
            style = "label",
            align = "left",

            icon = "5 ",
            hl = "Title",
            icon_hl = "BgAlt2",
        },
        heading_6 = {
            style = "label",
            align = "left",

            icon = "6 ",
            hl = "Title",
            icon_hl = "BgAlt2",
        },

        setext_1 = {
            style = "simple",
            hl = "Title"
        },

        setext_2 = {},
    },

    horizontal_rules = {
        enable = true,
    },

    html = {
        enable = false,
    },

    inline_codes = {
        enable = true,
    },

    latex = {
        enable = false,
    },

    links = {
        enable = false,
    },

    list_items = {
        enable = true,
        indent_size = 4,
        shift_width = 4,

        marker_minus = {
            add_padding = true,

            text = "-",
            hl = "MarkviewListItemMinus"
        },
        marker_plus = {
            add_padding = true,

            text = "+",
            hl = "MarkviewListItemPlus"
        },
        marker_star = {
            add_padding = true,

            text = "*",
            hl = "MarkviewListItemStar"
        },

        --- n. Items
        marker_dot = {
            add_padding = true
        },

        --- n) Items
        marker_parenthesis = {
            add_padding = true
        }
    },

    tables = {
        enable = false,
    },
}
