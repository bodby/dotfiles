local utils = require("bodby.utils")
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

-- Taken from nvim-lspconfig.
function get_lsp_clients(filter)
  return (vim.fn.has "nvim-0.11" == 1) and vim.lsp.get_clients(filter)
    or vim.lsp.get_active_clients(filter)
end

function validate_bufnr(bufnr)
  vim.validate {
    bufnr = { bufnr, "n" },
  }
  return bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
end

function get_active_client_by_name(bufnr, servername)
    for _, client in pairs(get_lsp_clients { bufnr = bufnr }) do
        if client.name == servername then
            return client
        end
    end
end

local function switch_source_header(bufnr)
    bufnr = validate_bufnr(bufnr)
    local clangd_client = get_active_client_by_name(bufnr, 'clangd')
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    if clangd_client then
        clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print("Corresponding file cannot be determined")
                return
            end
            vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
        end, bufnr)
    else
        print("method textDocument/switchSourceHeader is not supported by any servers active on the current buffer")
    end
end

local servers = {
    clangd = {
        name = "clangd",
        cmd = { "clangd" },

        filetypes = {
            "c",
            "cpp",
            "cuda"
        },

        root_dir = vim.fs.root(0, {
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
        }),

        capabilities = vim.tbl_extend("keep", cmp_caps, {
            textDocument = {
                completion = {
                    editsNearCursor = true
                },
            },
        }),

        single_file_support = true,
        offsetEncoding = { "utf-8", "utf-16" },
    },

    rust_analyzer = {
        name = "rust-analyzer",
        cmd = { "rust-analyzer" },

        filetypes = { "rust" },

        root_dir = vim.fs.root(0, {
            "Cargo.toml",
            "rust-project.json",
        }),

        capabilities = vim.tbl_extend("keep", cmp_caps, {
            experimental = {
                serverStatusNotification = false
            },
        }),

        single_file_support = true,
    },

    typescript_language_server = {
        init_options = { hostInfo = "neovim" },
        cmd = { "typescript-language-server", "--stdio" },

        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },

        root_dir = vim.fs.root(0, {
            "tsconfig.json",
            "jsconfig.json",
            "package.json",
            ".git",
        }),

        capabilities = cmp_caps,

        single_file_support = true,
    },

    -- default_config = {
    --     root_dir = [[root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")]],
    -- },
}

for name, config in pairs(servers) do
    if vim.fn.executable(servers[name].cmd[1]) ~= 0 then
        vim.api.nvim_create_autocmd("FileType", {
            pattern = config.filetypes,
            callback = function(event)
                vim.lsp.start(servers[name], { bufnr = event.buf })
            end
        })
    end
end

utils.aucmd("LspAttach", {
    callback = function(event)
        local lsp_opts = { buffer = event.buffer }

        utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",
            lsp_opts)
        utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>",
            lsp_opts)
        utils.map("n", "grc", function()
            switch_source_header(0)
        end, lsp_opts)

        utils.map("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>",
            lsp_opts)
        utils.map("n", "grd", "<cmd>lua vim.diagnostic.open_float()<cr>",
            lsp_opts)
        utils.map("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>",
            lsp_opts)
        utils.map("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>",
            lsp_opts)

        utils.map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>",
            lsp_opts)
        utils.map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            lsp_opts)
    end
})

local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
