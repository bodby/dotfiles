local utils = require("bodby.utils")

vim.g.mapleader = " "

-- Delete without affecting current clipboard content.
utils.map("v", "<leader>p", [["_dP]])
utils.map("v", "<leader>P", [["_dP]])
utils.map("nv", "<leader>d", [["_d]])
utils.map("nv", "<leader>D", [["_D]])
utils.map("nv", "<leader>c", [["_c]])
utils.map("nv", "<leader>C", [["_C]])
utils.map("nv", "<leader>x", [["_x]])
utils.map("nv", "<leader>X", [["_X]])
utils.map("nv", "<leader>s", [["_s]])
utils.map("nv", "<leader>S", [["_S]])

-- Yank to system clipboard.
utils.map("nv", "<leader>y", [["+y]])
utils.map("nv", "<leader>Y", [["+Y]])

-- Navitage between snippet tabstops.
-- This currently breaks tabs in insert mode.
-- utils.map("niv", "<tab>", function()
--   if (vim.snippet.active({ direction = 1})) then
--     return "<cmd>lua vim.snippet.jump(1)<cr>"
--   else
--     return "<tab>"
--   end
-- end, { expr = false })
--
-- utils.map("niv", "<S-tab>", function()
--   if (vim.snippet.active({ direction = 1})) then
--     return "<cmd>lua vim.snippet.jump(-1)<cr>"
--   else
--     return "<tab>"
--   end
-- end, { expr = true })
