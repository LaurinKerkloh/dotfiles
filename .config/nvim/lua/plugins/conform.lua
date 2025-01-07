return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      erb_format = {
        command = "bundle",
        prepend_args = { "exec", "erb-format", "--print-width", "120" },
        condition = function(_, ctx)
          local filetype = vim.bo[ctx.buf].filetype
          return filetype == "eruby" or filetype == "eruby.html"
        end,
      },
      tailwindcss_class_sorter_erb = {
        command = "npx",
        args = { "tailwindcss-class-sorter-erb" },
        condition = function(_, ctx)
          if vim.fn.system("npm list tailwindcss-class-sorter-erb | grep tailwindcss-class-sorter-erb") ~= 0 then
            return false
          end

          local filetype = vim.bo[ctx.buf].filetype
          return filetype == "eruby" or filetype == "eruby.html"
        end,
      },
      topiary = {
        command = "topiary",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    },
    formatters_by_ft = {
      eruby = { "erb_format" },
      html = { "topiary" },
      query = { "topiary" },
      toml = { "topiary" },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}
