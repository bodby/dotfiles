require("duck").setup()

-- Why?
vim.keymap.set("n", "<Leader>hh", "<Cmd>lua require('duck').hatch('󰃤', 10, '#89ddff')<CR>")
vim.keymap.set("n", "<Leader>hd", "<Cmd>lua require('duck').cook_all()<CR>")
