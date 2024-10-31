return {
    timeout = 2,
    maxkeys = 12,
    show_count = true,
    position = "top-right",
    excluded_modes = { "i", "c" },

    keyformat = {
        ["<BS>"] = "Bksp",
        ["<CR>"] = "Enter",
        ["<Space>"] = "Space",
        ["<Up>"] = "Up",
        ["<Down>"] = "Down",
        ["<Left>"] = "Left",
        ["<Right>"] = "Right",
        ["<PageUp>"] = "PgUp ",
        ["<PageDown>"] = "PgUp",
        ["<M>"] = "Alt",
        ["<C>"] = "Ctrl",
    },
}
