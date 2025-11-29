return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "┃", texthl = "GitSignsAdd" },
      change = { text = "┃", texthl = "GitSignsChange" },
      delete = { text = "_", texthl = "GitSignsDelete" },
      topdelete = { text = "‾", texthl = "GitSignsDelete" },
      changedelete = { text = "~", texthl = "GitSignsChange" },
      untracked = { text = "┆", texthl = "GitSignsAdd" },
    },
    numhl = true,
    linehl = false,
    word_diff = false,
  },
}
