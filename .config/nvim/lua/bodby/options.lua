-- Globals (more at bottom).
vim.g.material_style = "darker"

-- Eye candy.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.signcolumn = "yes"
vim.opt_global.listchars = {
	space = ' ',
	tab = "~-",
	trail = '~',
	eol = '~',
	extends = '+',
	precedes = '-'
}
vim.opt.fillchars = {
	fold = '·',
	foldsep = ' '
}

-- Show less information.
vim.opt.showmode = false
vim.opt.pumheight = 16
vim.opt.confirm = true
vim.opt.timeoutlen = 1000
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.opt.scrolloff = 12

vim.opt.mouse = ''

-- Formatting.
vim.opt.expandtab = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.breakindent = false
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.require('bodby.utils').custom_foldtext()"

-- Custom comment strings.
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring"
		and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end

-- Window options.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Searching.
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Allow undoing files even after closing neovim.
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- These are ugly.
vim.g.loaded_perl_provider = 0
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1
