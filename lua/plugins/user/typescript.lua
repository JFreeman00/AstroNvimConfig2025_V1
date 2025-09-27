---@type LazySpec
return {
  "AstroNvim/astrolsp",
  opts = {
    servers = {
      "ts_ls", -- Modern TypeScript/JavaScript language server
    },
    config = {
      ts_ls = {
        filetypes = {
          "javascript",
          "javascriptreact", -- React .jsx filer
          "typescript",
          "typescriptreact", -- React .tsx filer
        },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
            },
          },
        },
      },
    },
  },
}
