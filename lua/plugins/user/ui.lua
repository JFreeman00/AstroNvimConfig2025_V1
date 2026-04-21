-- ~/.config/nvim/lua/plugins/ui.lua
return {
-- Transparent bakgrund

  --{
    --"AstroNvim/astroui",
    --opts = {
      --highlights = {
        --init = {
          --Normal        = { bg = "NONE" },
          --NormalNC      = { bg = "NONE" },
          --NormalFloat   = { bg = "NONE" },
          --FloatBorder   = { bg = "NONE" },
          --SignColumn    = { bg = "NONE" },
          --WinSeparator  = { bg = "NONE" },
          --LineNr        = { bg = "NONE" },
          --LineNrAbove   = { bg = "NONE" },
          --LineNrBelow   = { bg = "NONE" },
          --DiagnosticSignError = { bg = "NONE" },
          --DiagnosticSignWarn  = { bg = "NONE" },
          --DiagnosticSignInfo  = { bg = "NONE" },
          --DiagnosticSignHint  = { bg = "NONE" },
          --NeoTreeNormal      = { bg = "NONE" },  -- när fokus är i neo-tree
          --NeoTreeNormalNC    = { bg = "NONE" },  -- när fokus är någon annanstans
        --},
      --},
    --},
  --},
  -- Inaktivera Heirline helt
  { "rebelot/heirline.nvim", enabled = false },

  -- Bufferline för tydlig tabline
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      -- Aktivera mousemoveevent för hover
      vim.opt.mousemoveevent = true

      -- Bufferline konfiguration
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        -- Hover funktionalitet
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        -- Offset för att undvika överlappning med sidopanel/linenumbers
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },

        show_tab_indecators = false,

        -- Separator stil
        separator_style = "thin", -- eller "thick", "slant", "padded_slant"

        -- Visa close buttons
        show_close_icon = true,
        show_buffer_close_icons = true,

        -- Justera position
        enforce_regular_tabs = false,
        always_show_bufferline = true,

        -- Göra buffer större/tabs
        max_name_length = 25,
        max_prefix_length = 15,
        tab_size = 25,
      })

      -- Highlight groups för vit/grå underline
      opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, {
        -- Aktiv buffer/tab
        buffer_selected = {
          fg = "#ffffff",
          bg = "NONE",
          underline = true,
          sp = "#ffffff", -- underline färg (vit)
          bold = true,
          italic = false,
        },

        -- Inaktiv buffer/tab
        buffer_visible = {
          fg = "#a0a0a0",
          bg = "NONE",
          underline = true,
          sp = "#808080", -- underline färg (grå)
        },

        -- Standard buffer
        buffer = {
          fg = "#a0a0a0",
          bg = "NONE",
          underline = true,
          sp = "#606060", -- underline färg (mörkare grå)
        },

        -- Tab separators
        separator_selected = {
          fg = "#ffffff",
          bg = "NONE",
        },
        separator_visible = {
          fg = "#808080",
          bg = "NONE",
        },
        separator = {
          fg = "#606060",
          bg = "NONE",
        },

        -- Close button highlights
        close_button_selected = {
          fg = "#ffffff",
          bg = "NONE",
        },
        close_button_visible = {
          fg = "#808080",
          bg = "NONE",
        },
        close_button = {
          fg = "#606060",
          bg = "NONE",
        },
      })

      return opts
    end,
  },

  -- Lualine för statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local lualine = require "lualine"
      local lazy_status = require "lazy.status"

      local colors = {
        orange = "#FFA500",
        mOrange = "#FF5E00",
        emOrange = "#FF1900",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        fg = "#c3ccdc",
        bg = "#2E2E2E",
        inactive_bg = "#2c3043",
        semilightgray = "#888888",
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.mOrange, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.emOrange, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
          b = { bg = colors.inactive_bg, fg = colors.semilightgray },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }

      lualine.setup {
        options = {
          theme = my_lualine_theme,
          globalstatus = true,
        },
        sections = {
          lualine_b = {
            {
              "branch",
              "diagnostics",
              sources = { "nvim_diagnostic" },
              sections = { "error", "warn", "info" },
              symbols = { error = " ", warn = " ", info = " " },
              colored = true,
              update_in_insert = false,
              always_visible = false,
            },
            { function() return "|" end, color = { fg = "#555555" } },
            {
              path = 1,
            },
          },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#ff9e64" },
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
          },
        },
      }
    end,
  },
}
