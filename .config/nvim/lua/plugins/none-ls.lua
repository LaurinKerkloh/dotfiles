return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        return {
            sources = {
                -- Linters
                null_ls.builtins.diagnostics.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" },
                }),
                -- Formatters
                null_ls.builtins.formatting.erb_format.with({
                    command = { "bundle", "exec", "erb-format" },
                    extra_args = { "--print-width", "120" },
                }),
                null_ls.builtins.formatting.leptosfmt.with({
                    extra_args = { "--max-width", "120", "--tab-spaces", "4", "--experimental-tailwind" },
                }),
                null_ls.builtins.formatting.prettier.with({
                    filetypes = vim.list_extend(null_ls.builtins.formatting.prettier.filetypes, {
                        "toml",
                        "gohtmltmpl",
                    }),
                }),
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = { "-i", "2" },
                }),
                null_ls.builtins.formatting.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" },
                }),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        }
    end,
}
