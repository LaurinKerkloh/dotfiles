return {
    "dense-analysis/ale",
    config = function()
        vim.g.ale_linters = {
            scad = { "openscad" },
        }
    end,
}
