local cmp = require("cmp")

local type_icons = {
    Text = "󰊄",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "󰒓",
    Field = "󰆼",
    Variable = "󰙎",
    Class = "󱥒",
    Interface = "󰡖",
    Module = "󰐱",
    Property = "󰓹",
    Unit = "󱍓",
    Value = "󰎠",
    Enum = "󰖽",
    Keyword = "󰌆",
    Snippet = "󰅩",
    Color = "󰏘",
    File = "󰈔",
    Reference = "󰿨",
    Folder = "󰝰",
    EnumMember = "󰬴",
    Constant = "󰏿",
    Struct = "󰆩",
    Event = "󰉁",
    Operator = "󰦒",
    TypeParameter = "󰅪",
}

return {
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- vim_item.kind:lower())
            vim_item.kind = string.format("%s", type_icons[vim_item.kind])

            -- I don't like this.
            vim_item.abbr = vim_item.abbr:gsub("•", " "):gsub(" ", "")

            -- vim_item.menu = ({
            --   buffer = "[Buffer]",
            --   nvim_lsp = "[LSP]",
            --   luasnip = "[LuaSnip]",
            --   nvim_lua = "[Lua]",
            --   latex_symbols = "[LaTeX]",
            -- })[entry.source.name]

            vim_item.menu = nil

            return vim_item
        end
    },

    performance = {
        -- max_view_entries = 16,
    },

    experimental = {
        ghost_text = false,
    },

    view = {
        docs = {
            auto_open = false,
        },
        entries = "custom",
    },

    -- window = {
    --   completion = cmp.config.window.bordered({}),
    --   documentation = cmp.config.window.bordered(),
    -- },

    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
    }),

    sources = cmp.config.sources({ { name = "nvim_lsp" }, }, { { name = "buffer" }, }),
}
