-- Neo-tree configuration to show hidden files by default
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,         -- Show filtered items
        hide_dotfiles = false,  -- Show dotfiles by default
        hide_gitignored = false, -- Show gitignored files
        hide_by_name = {},
        never_show = {},
      },
    },
  },
}

