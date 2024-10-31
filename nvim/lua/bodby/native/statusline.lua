local utils = require("bodby.utils")

Statusline = {}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_string = {
        ["n"] = "normal",
        ["no"] = "normal",
        ["v"] = "visual",
        ["V"] = "visual/line",
        [""] = "visual/block",
        ["s"] = "select",
        ["S"] = "select/line",
        [""] = "select/block",
        ["i"] = "insert",
        ["ic"] = "insert",
        ["R"] = "replace",
        ["Rv"] = "replace/visual",
        ["c"] = "command",
        ["cv"] = "vim ex",
        ["ce"] = "ex",
        ["r"] = "prompt",
        ["rm"] = "moar",
        ["r?"] = "confirm",
        ["!"] = "shell",
        ["t"] = "terminal",
    }

    -- StatusLine<Mode>.
    local mode_colors = {
        ["n"] = "Normal",
        ["no"] = "Normal",
        ["v"] = "Visual",
        ["V"] = "Visual",
        ["v"] = "Visual",
        ["s"] = "Visual",
        ["S"] = "Visual",
        [""] = "Visual",
        [""] = "Visual",
        ["i"] = "Insert",
        ["ic"] = "Insert",
        ["R"] = "Replace",
        ["Rv"] = "Replace",
        ["c"] = "Command",
        ["t"] = "Command",
    }

    local current_mode_color = mode_colors[current_mode]

    if current_mode_color then
        current_mode_color = "StatusLine" .. current_mode_color
    else
        current_mode_color = "StatusLine"
    end

    return "%#" .. current_mode_color .. "#" .. ": "
end

local function file()
    local cur_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
    local fmt_path = string.format("%%<%s/", cur_path)

    if cur_path == "" or cur_path == "." or cur_path == "./" then
        fmt_path = ""
    end

    local mod_sign = ""
    local buf = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_get_option(buf, "modified") then
        mod_sign = "%#StatusLineBracket#, %#StatusLineModified#+"
    end

    local cur_file = vim.fn.expand("%:t")
    if cur_file == "" then
        return "%#StatusLinePath#" .. "none" .. mod_sign
    end

    return "%#StatusLinePath#" .. fmt_path .. cur_file .. mod_sign
end

Statusline.recording_macro = false

local function macro()
    if Statusline.recording_macro == true then
        local register = vim.fn.reg_recording()
        return "%#StatusLineBracket#,%#StatusLineMacro# " .. vim.fn.reg_recording()
    else
        return ""
    end
end

local function cursor_pos()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    return "%#StatusLinePos#" .. row .. ":" .. col
end

utils.aucmd("RecordingEnter", {
    callback = function(event)
        Statusline.recording_macro = true
    end
})

utils.aucmd("RecordingLeave", {
    callback = function(event)
        Statusline.recording_macro = false
    end
})

local function diagnostics()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for x, level in pairs(levels) do
        count[x] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""

    errors = "%#DiagnosticSignError#" .. count["errors"] .. " "
    warnings = "%#DiagnosticSignWarn#" .. count["warnings"] .. " "
    hints = "%#DiagnosticSignHint#" .. count["hints"] .. " "
    info = "%#DiagnosticSignInfo#" .. count["info"] .. " "

    return errors .. warnings .. hints .. info .. "%#StatusLine#"
end

Statusline.active = function()
    return table.concat({
        "%#StatusLine#",
        "%#StatusLineBracket#[",
        -- mode(),
        file(),
        macro(),
        "%#StatusLineBracket#]",
        "%#StatusLine#%=",
        -- diagnostics(),
        cursor_pos(),
    })
end

Statusline.inactive = function()
    return ""
end

utils.aucmd({ "WinEnter", "BufEnter" }, {
    callback = function(event)
        vim.opt_local.statusline = "%!v:lua.Statusline.active()"
    end
})

utils.aucmd({ "WinLeave", "BufLeave" }, {
    callback = function(event)
        vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
    end
})

utils.aucmd("InsertEnter", {
    callback = function(event)
        vim.opt.cmdheight = 1
        vim.opt.cmdheight = 0
    end
})

utils.aucmd("CmdwinLeave", {
    callback = function(event)
        vim.opt.cmdheight = 1
        vim.opt.cmdheight = 0
    end
})

utils.aucmd({ "CmdlineLeave", "TextYankPost" }, {
    callback = function(event)
        vim.fn.timer_start(0, function()
            vim.opt_local.statusline = "%!v:lua.Statusline.active()"
        end)
    end
})
