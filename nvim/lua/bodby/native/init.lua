local utils = require("bodby.utils")

require("bodby.native.lsp")
require("bodby.native.statuscolumn")
require("bodby.native.statusline")

utils.aucmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})
