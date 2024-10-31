require("mini.pick").setup({
  delay = {
    async = 10,
    busy = 50,
  },

  mappings = {
    caret_left = "<left>",
    caret_right = "<right>",

    choose = "<cr>",
    choose_in_split = "<C-s>",
    choose_in_tabpage = "<C-t>",
    choose_in_vsplit = "<C-v>",
    choose_marked = "<M-CR>",

    delete_char = "<bs>",
    delete_char_right = "<del>",
    delete_left = "<C-u>",
    delete_word = "<C-w>",

    mark = "<tab>",
    mark_all = "<C-a>",

    move_down = "<C-n>",
    move_start = "<C-g>",
    move_up = "<C-p>",

    paste = "<C-r>",

    refine = "<C-space>",
    refine_marked = "<M-space>",

    scroll_down = "<C-f>",
    scroll_left = "<C-h>",
    scroll_right = "<C-l>",
    scroll_up = "<C-b>",

    stop = "<Esc>",

    -- toggle_info = "<S-Tab>",
    -- toggle_preview = "<Tab>",
  },

  options = {
    content_from_bottom = true,
    use_cache = true,
  },

  source = {
    items = nil,
    name = nil,
    cwd = nil,

    match = nil,
    show = nil,
    preview = nil,

    choose = nil,
    choose_marked = nil,
  },

  window = {
    config = nil,
    prompt_cursor = "▏",
    prompt_prefix = "> ",
  },
})
