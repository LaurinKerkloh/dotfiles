return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.erb_format.with({
                    args = { "--print-width", "120" },
                }),
                -- null_ls.builtins.formatting.topiary.with({
                --     filetypes = { "eruby", "scm" },
                -- }),
                null_ls.builtins.formatting.prettier.with({
                    filetypes = vim.tbl_extend("force", null_ls.builtins.formatting.prettier.filetypes, {
                        "gohtmltmpl",
                    }),
                }),
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = { "-i", "2" },
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
        })
    end,
}
