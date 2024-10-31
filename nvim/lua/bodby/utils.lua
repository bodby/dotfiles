local Utils = {}

Utils.aucmd = vim.api.nvim_create_autocmd

function Utils.nf_icon(icon, hl, reset_hl)
    return "%#" .. hl .. "#" .. icon .. " " .. "%#" .. reset_hl .. "#"
end

function Utils.map(modes, keys, action)
    local mode_table = {}
    local map_opts = {
        silent = true
    }

    modes:gsub(".", function(c)
        table.insert(mode_table, c)
    end)

    vim.keymap.set(mode_table, keys, action, map_opts)
end

return Utils
