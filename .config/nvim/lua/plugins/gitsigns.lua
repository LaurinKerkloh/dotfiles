return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    keys = {
        { "]h",          "<cmd>Gitsigns next_hunk<cr>" },
        { "[h",          "<cmd>Gitsigns prev_hunk<cr>" },
        { "<leader>gsp", "<cmd>Gitsigns preview_hunk<cr>" },
        { "<leader>gsl", "<cmd>Gitsigns preview_hunk_inline<cr>" },
        { "<leader>gss", "<cmd>Gitsigns stage_hunk<cr>" },
        { "<leader>gsu", "<cmd>Gitsigns undo_stage_hunk<cr>" },
        { "<leader>gsr", "<cmd>Gitsigns reset_hunk<cr>" },
        { "<leader>gsq", "<cmd>Gitsigns setqflist<cr>" },
        { "<leader>gsd", "<cmd>Gitsigns diffthis<cr>" },
    },
    opts = {},
}
