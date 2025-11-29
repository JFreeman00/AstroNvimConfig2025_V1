-- OneDark colorscheme configuration for AstroNvim v5
return {
  "olimorris/onedarkpro.nvim",
  lazy = false, -- make sure we load this during startup
  priority = 1000, -- Ensure it loads before other plugins
  config = function()
    require("onedarkpro").setup {
      theme = "onedark", --onedark, onelight, onedark_vivid, onedark_dark
      options = {
        transparency = false,
        terminal_colors = true,
        highlight_inactive_windows = false,
      },
      highlights = {
        Comment = { italic = true },
      },
      plugins = {
        nvim_lsp = true,
        telescope = true,
        treesitter = true,
        nvim_cmp = true,
        gitsigns = true,
      },
    }
    vim.cmd "colorscheme onedark"
  end,
}
