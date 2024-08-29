vim.keymap.set('n', "<Leader>n", function()
	require("nabla").toggle_virt({
		autogen = true,
		silent = false
	})
end)
