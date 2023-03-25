return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>sf",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "Browse File",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
