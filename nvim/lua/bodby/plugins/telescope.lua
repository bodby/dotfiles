return {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = "move_selection_next",
                ["<C-p>"] = "move_selection_previous",
                ["<tab>"] = "toggle_selection",
                ["<cr>"] = "select_default",
                ["<esc>"] = "close",
            },
        },
        layout_strategy = "bottom_pane",
        border = false,
        hl_result_eol = false,
        -- file_sorter = require("telescope.sorters").get_fzy_sorter,
        -- generic_sorter = require("telescope.sorters").get_fzy_sorter,
        preview = {
            hide_on_startup = true,
        },
    },

    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
    ["zf-native"] = {
        -- options for sorting file-like items
        file = {
            -- override default telescope file sorter
            enable = true,

            -- highlight matching text in results
            highlight_results = true,

            -- enable zf filename match priority
            match_filename = true,

            initial_sort = nil,

            smart_case = true,
        },

        generic = {
            enable = true,

            highlight_results = true,

            match_filename = false,

            initial_sort = nil,

            smart_case = true,
        },
    }
}
