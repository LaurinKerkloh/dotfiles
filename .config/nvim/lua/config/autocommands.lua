-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set filetype to ruby for thor files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = { "*.thor" },
    callback = function()
        vim.bo.filetype = "ruby"
    end,
})
-- Set Commentstring for openscad
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "openscad" },
    callback = function()
        require("Comment.ft").set("openscad", "// %s")
    end,
})
