-- lua/plugins.lua
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        filters = { dotfiles = true },

        -- THIS IS THE IMPORTANT PART
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,

        -- Prevent conflicts on startup
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          -- default mappings
          api.config.mappings.default_on_attach(bufnr)
        end,
      })
    end,
  },
  -- LSP & Mason
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("config.mason")        -- we'll create this
      require("config.lsp")          -- we'll create this
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.cmp")
    end,
  },
})
