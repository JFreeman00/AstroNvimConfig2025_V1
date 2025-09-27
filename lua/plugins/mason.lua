---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
      -- Language servers
        "lua-language-server",
        "pyright",
        "jdtls",
        "clangd",

        -- JavaScript / TypeScript
        "prettier",
        "eslint_d",
        "typescript-language-server",

        -- Python
        "black",
        "isort",
        "pylint",

        -- Java
        "google-java-format",
        "checkstyle",

        -- C / C++
        "clang-format",
        "cpplint",

        -- Misc
        "jsonlint",
        "tree-sitter-cli",

        -- Debuggers
        "debugpy",

        -- Formatters
        "stylua",
      },
      auto_update = true,
    },
  },
}
