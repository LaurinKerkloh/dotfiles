return {
    "tpope/vim-rails",
    config = function()
        vim.api.nvim_create_autocmd(
            { "BufNewFile", "BufReadPost" },
            {
                pattern = { "*.yml" },
                callback = function()
                    vim.bo.filetype = "yaml"
                end,

            }
        )

        vim.keymap.set("n", "<leader>rm", "<cmd>Emodel<CR>", { desc = "Go to Rails model" })
        vim.keymap.set("n", "<leader>rv", "<cmd>Eview<CR>", { desc = "Go to Rails view" })
        vim.keymap.set("n", "<leader>rc", "<cmd>Econtroller<CR>", { desc = "Go to Rails controller" })
        vim.keymap.set("n", "<leader>rh", "<cmd>Ehelper<CR>", { desc = "Go to Rails helper" })
    end,
}
