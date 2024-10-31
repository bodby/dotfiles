local utils = require("bodby.utils")

-- Material.
local material_cfg = require("bodby.plugins.material")
require("material").setup(material_cfg)

vim.g.material_style = "darker"
vim.cmd.colorscheme("material")
vim.opt.guicursor = "a:Cursor/Cursor"

-- Nvim-cmp.
local cmp_cfg = require("bodby.plugins.cmp")
require("cmp").setup(cmp_cfg)

-- Showkeys.
local showkeys_cfg = require("bodby.plugins.showkeys")
require("showkeys").setup(showkeys_cfg)

-- Feed.nvim.
-- local feed_cfg = require("bodby.plugins.feed")
-- require("feed").setup(feed_cfg)

-- Markview.nvim and nabla.nvim.
local markview_cfg = require("bodby.plugins.markview")
require("markview").setup(markview_cfg)

do
    local previewing = false
    local function toggle_render()
        if previewing then
            require("nabla").disable_virt()
            vim.cmd("Markview disableAll")
        else
            require("nabla").enable_virt({
                autogen = true,
                silent = false
            })
            vim.cmd("Markview enable")
        end
        previewing = not previewing
        vim.opt.concealcursor = "nc"
        vim.opt.wrap = true
        vim.opt.linebreak = true
        -- opt.colorcolumn = active and '' or '100'
    end
    utils.map("n", "<leader>n", toggle_render)

    -- Don't break line wrapping when entering insert mode and rendering Markdown/LaTex.
    utils.aucmd("InsertEnter", {
        callback = function(event)
            require("nabla").disable_virt()
            vim.cmd("Markview disableAll")
            previewing = false
        end
    })
end

-- Smartcolumn.
local smartcolumn_cfg = require("bodby.plugins.smartcolumn")
require("smartcolumn").setup(smartcolumn_cfg)

-- Telescope.
local telescope_cfg = require("bodby.plugins.telescope")
local telescope = require("telescope")
telescope.setup(telescope_cfg)

telescope.load_extension("zf-native")

utils.map("n", "<leader>ff", function()
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    require("telescope.builtin").find_files(themes.get_cursor({
        previewer = false
    }))
end)

utils.map("n", "<leader>fb", function()
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    require("telescope.builtin").buffers(themes.get_cursor({
        previewer = false
    }))
end)

utils.map("n", "<leader>fg", function()
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    require("telescope.builtin").live_grep(themes.get_cursor({
        previewer = false
    }))
end)

-- utils.map("n", "<leader>fh", builtin.help_tags)
-- utils.map("n", "<leader>fh", builtin.lsp_references)

-- require("bodby.plugins.pick")
-- require("bodby.plugins.duck")
-- require("bodby.plugins.mkdnflow")
-- require("bodby.plugins.orgmode")
