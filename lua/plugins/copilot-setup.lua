-- return {
--   -- {
--   --   "zbirenbaum/copilot.lua",
--   --   -- cmd = "Copilot",
--   --   -- build = ":Copilot auth",
--   --   -- opts = {
--   --   --   suggestion = { enabled = false },
--   --   --   panel = { enabled = false },
--   --   --   filetypes = {
--   --   --     markdown = true,
--   --   --     help = true,
--   --   --   },
--   --   -- },
--   --   enabled = true,
--   --   cmd = "Copilot",
--   --   event = "InsertEnter",
--   --   opts = {
--   --     suggestion = { enabled = false },
--   --     panel = { enabled = false },
--   --   },
--   {
--     "nvim-lualine/lualine.nvim",
--     optional = true,
--     event = "VeryLazy",
--     opts = function(_, opts)
--       local Util = require("lazyvim.util")
--       local colors = {
--         [""] = Util.fg("Special"),
--         ["Normal"] = Util.fg("Special"),
--         ["Warning"] = Util.fg("DiagnosticError"),
--         ["InProgress"] = Util.fg("DiagnosticWarn"),
--       }
--       table.insert(opts.sections.lualine_x, 2, {
--         function()
--           local icon = require("lazyvim.config").icons.kinds.Copilot
--           local status = require("copilot.api").status.data
--           return icon .. (status.message or "")
--         end,
--         cond = function()
--           local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
--           return ok and #clients > 0
--         end,
--         color = function()
--           if not package.loaded["copilot"] then
--             return
--           end
--           local status = require("copilot.api").status.data
--           return colors[status.status] or colors[""]
--         end,
--       })
--     end,
--   },
-- },
-- -- copilot
-- {
--   "zbirenbaum/copilot.lua",
--   enabled = true,
--   cmd = "Copilot",
--   event = "InsertEnter",
--   opts = {
--     suggestion = { enabled = false },
--     panel = { enabled = false },
--   },
-- },
-- {
--   "nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-emoji",
--     {
--       "zbirenbaum/copilot-cmp",
--       opts = {},
--     },
--   },
--   ---@param opts cmp.ConfigSchema
--   opts = function(_, opts)
--     local cmp = require("cmp")
--     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" }, { name = "emoji" } }))
--     opts.mapping = vim.tbl_extend("force", opts.mapping, {
--       ["<CR>"] = cmp.mapping.confirm({
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = true,
--       }),
--     })
--   end,
-- }
--   {
--     "zbirenbaum/copilot-cmp",
--     dependencies = "copilot.lua",
--     opts = {},
--     config = function(_, opts)
--       local copilot_cmp = require("copilot_cmp")
--       copilot_cmp.setup(opts)
--       -- attach cmp source whenever copilot attaches
--       -- fixes lazy-loading issues with the copilot cmp source
--       require("lazyvim.util").on_attach(function(client)
--         if client.name == "copilot" then
--           copilot_cmp._on_insert_enter({})
--         end
--       end)
--     end,
--   },
-- }
return {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      {
        "zbirenbaum/copilot-cmp",
        opts = {},
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" }, { name = "emoji" } }))
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      })
    end,
  },
}
