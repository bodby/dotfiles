-- Load rocks.nvim.
local install_location = vim.fs.joinpath(vim.fn.stdpath("data"), "rocks")

local rocks_config = {
	rocks_path = vim.fs.normalize(install_location),
	luarocks_binary = "/usr/bin/luarocks"
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
	vim.fs.joinpath(rocks_config.rocks_path,
	"share", "lua", "5.1", "?.lua"),
	vim.fs.joinpath(rocks_config.rocks_path,
	"share", "lua", "5.1", "?", "init.lua")
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
	vim.fs.joinpath(rocks_config.rocks_path,
	"lib", "lua", "5.1", "?.so"),
	vim.fs.joinpath(rocks_config.rocks_path,
	"lib64", "lua", "5.1", "?.so"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path,
"lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))

-- For TS parsers.
vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path,
"lib", "luarocks", "rocks-5.1", "tree-sitter-*", "*"))

require("bodby")
