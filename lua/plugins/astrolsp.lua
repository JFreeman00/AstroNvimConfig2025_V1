---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = false,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {},
    config = {},
    handlers = {},
    -- Buffer-local autocmds

    autocmds = {
      lsp_codelens_refresh = {
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then
              vim.lsp.codelens.refresh { bufnr = args.buf }
            end
          end,
        },
      },
      lsp_hover_diagnostics = {
        {
          event = "CursorHold",
          desc = "Show hover info or diagnostics on cursor hold",
          callback = function()
            local hover_ok, _ = pcall(vim.lsp.buf.hover)
            if not hover_ok then
              local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = "rounded",
                source = "always",
                prefix = " ",
                scope = "cursor",
              }
              vim.diagnostic.open_float(nil, opts)
            end
          end,
        },
      },
    },
   -- Key mappings for LSP
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
        ["<Leader>lh"] = {
          function() vim.lsp.buf.hover() end,
          desc = "Show function signature and documentation",
          cond = "textDocument/hover",
        },
        K = {
          function() vim.lsp.buf.hover() end,
          desc = "Show hover (function details)",
          cond = "textDocument/hover",
        },
      },
      i = {
        ["<C-k>"] = {
          function() vim.lsp.buf.signature_help() end,
          desc = "LSP Signature Help",
          cond = "textDocument/signatureHelp",
        },
      },
    },
    -- Custom on_attach function
    on_attach = function(client, bufnr)
      -- Optional: disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
