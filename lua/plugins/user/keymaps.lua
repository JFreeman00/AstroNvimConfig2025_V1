return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      n = {
        -- Splits
        ["<leader>sv"] = { "<C-w>v", desc = "Split window vertically" },
        ["<leader>sh"] = { "<C-w>s", desc = "Split window horizontally" },
        ["<leader>se"] = { "<C-w>=", desc = "Make splits equal size" },
        ["<leader>sx"] = { "<cmd>close<CR>", desc = "Close current split" },

        -- Tabs
        ["<leader>to"] = { "<cmd>tabnew<CR>", desc = "Open new tab" },
        ["<leader>tx"] = { "<cmd>tabclose<CR>", desc = "Close current tab" },
        ["<leader>tn"] = { "<cmd>tabn<CR>", desc = "Go to next tab" },
        ["<leader>tp"] = { "<cmd>tabp<CR>", desc = "Go to previous tab" },
        ["<leader>tf"] = { "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },

        -- Buffers
        ["<leader>bn"] = { "<cmd>bnext<CR>", desc = "Next buffer" },
        ["<leader>bp"] = { "<cmd>bprevious<CR>", desc = "Previous buffer" },
      },
    },
  },
}
