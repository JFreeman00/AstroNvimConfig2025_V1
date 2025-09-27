---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = {
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = {
        cmd = {
          "clangd",
          "--compile-commands-dir=.",
          "--background-index",
          "--clang-tidy",
          "--all-scopes-completion",
          "--completion-style=detailed",
          "--header-insertion=never",
          "--pch-storage=memory",
          "--suggest-missing-includes",
        },
        capabilities = {
          offsetEncoding = "utf-8",
        },
        init_options = {
          clangdFileStatus = true,
          usePlaceholders = true,
          completeUnimported = true,
          semanticHighlighting = true,
        },
      },
    },
  },
}
