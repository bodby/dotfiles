local install_location = vim.fs.joinpath(vim.fn.stdpath("data"), "rocks")

vim.g.rocks_nvim = {
    rocks_path = vim.fs.normalize(install_location),
    luarocks_binary = "/usr/bin/luarocks",
    lazy = true,
    dynamic_rtp = false,
    enable_luarocks_loader = false,
}

local luarocks_path = {
    vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
    "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
    "share", "lua", "5.1", "?", "init.lua"),
}

package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
    vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
    "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
    "lib64", "lua", "5.1", "?.so"),
}

package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
"lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))
vim.opt.runtimepath:append(vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
"lib", "luarocks", "rocks-5.1", "tree-sitter-*", "*"))

require("bodby")
