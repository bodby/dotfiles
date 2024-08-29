vim.g.mapleader = ' '

local bodby_group = vim.api.nvim_create_augroup("Bodby", {})
local opts = {
	silent = true
}

vim.keymap.set('n', "<C-d>", "<C-d>zz", opts)
vim.keymap.set('n', "<C-u>", "<C-u>zz", opts)

vim.keymap.set('n', "<Leader><CR>", function()
	vim.snippet.expand("TM_CURRENT_WORD")
end, opts)
vim.keymap.set('n', 'n', function()
	if (vim.snippet.active({ direction = 1})) then
		return "<Cmd>lua vim.snippet.jump(1)<CR>"
	else
		return 'nzzzv'
	end
end, { expr = true })
vim.keymap.set('n', 'N', function()
	if (vim.snippet.active({ direction = 1})) then
		return "<Cmd>lua vim.snippet.jump(-1)<CR>"
	else
		return 'Nzzzv'
	end
end, { expr = true })

vim.keymap.set('v', "<Leader>p", [["_dP]])
vim.keymap.set({'n', 'v'}, "<Leader>d", [["_d]])
vim.keymap.set({'n', 'v'}, "<Leader>c", [["_c]])
vim.keymap.set({'n', 'v'}, "<Leader>y", [["+y]])
vim.keymap.set('n', "<Leader>Y", [["+Y]])

vim.api.nvim_create_autocmd("LspAttach", {
	group = bodby_group,
	callback = function(event)
		local auopts = { buffer = event.buffer }

		vim.keymap.set('n', "gd", function() vim.lsp.buf.definition()
		end, auopts)
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover()
		end, auopts)
		vim.keymap.set('n', "<Leader>lr", function() vim.lsp.buf.rename()
		end, auopts)
		vim.keymap.set('n', "<Leader>ld", function() vim.diagnostic.open_float()
		end, auopts)
		vim.keymap.set('n', "<Leader>la", function() vim.lsp.buf.code_action()
		end, auopts)
		vim.keymap.set('n', "]d", function() vim.diagnostic.goto_next()
		end, auopts)
		vim.keymap.set('n', "[d", function() vim.diagnostic.goto_prev()
		end, auopts)
	end
})
