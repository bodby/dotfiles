local servers = {
	clangd = {
		name = "clangd",
		cmd = { "clangd" },
		root_dir = vim.fs.root(0, {
			".clangd", ".clang-tidy", ".clang-format",
			"compile_commands.json", "compile_flags.txt", "configure.ac",
		}),
		filetypes = { 'c', "cpp", "cuda" },
		single_file_support = true,
		capabilities = {
			textDocument = {
				completion = {
					editsNearCursor = true
				}
			},

			offsetEncoding = { "utf-8", "utf-16" }
		}
	},
	rust_analyzer = {
		name = "rust-analyzer",
		cmd = { "rust-analyzer" },
		-- TODO: Check whether this works or not.
		root_dir = vim.fs.root(0, {
			"Cargo.toml", "rust-project.json"
		}),
		filetypes = { "rust" },
		single_file_support = true,
		capabilities = {
			experimental = {
				serverStatusNotification = true,
			}
		}
	}
}

for name, config in pairs(servers) do
	if vim.fn.executable(servers[name].cmd[1]) ~= 0 then
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = config.filetypes,
			callback = function(ev)
				vim.lsp.start(servers[name], { bufnr = ev.buf })
			end
		})
	end
end
