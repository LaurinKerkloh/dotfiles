return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      d2 = { "d2" },
      eruby = { "tailwindcss_class_sorter_erb", "erb_format" },
      html = { "prettier" },
      javascript = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      query = { "topiary" },
      scss = { "prettier" },
      templ = { "prettier" },
      toml = { "topiary" },
      typescript = { "prettier" },
      yaml = { "prettier" },
    },
    formatters = {
      erb_format = {
        command = "bundle",
        prepend_args = { "exec", "erb-format", "--print-width", "120" },
        condition = function(_, ctx)
          local filename = vim.fn.expand("%:t")
          local ending = ".html.erb"
          return string.sub(filename, - #ending) == ending
        end,
      },
      tailwindcss_class_sorter_erb = {
        command = "node_modules/.bin/tailwindcss-class-sorter-erb",
        condition = function(_, ctx)
          local filename = vim.fn.expand("%:t")
          local ending = ".html.erb"
          return string.sub(filename, - #ending) == ending
        end,
      },
      topiary = {
        command = "topiary",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}
