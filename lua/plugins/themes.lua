return {
  -- {
  --   "hardhackerlabs/theme-vim",
  --   config = function()
  --     vim.cmd.colorscheme("hardhacker")
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --   },
  -- },
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     background_colour = "#000000",
  --   },
  -- },
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "neanias/everforest-nvim" },
  --
  -- -- Configure LazyVim to load gruvbox
  -- add catppuccin
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      -- colorscheme = "dawnfox",
    },
  },
}
