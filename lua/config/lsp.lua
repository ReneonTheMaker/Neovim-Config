-- lua/config/lsp.lua
local capabilities = _G.cmp_nvim_lsp_capabilities or require("cmp_nvim_lsp").default_capabilities()

-- rest of the file stays the same...
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘ ",
      [vim.diagnostic.severity.WARN]  = "▲ ",
      [vim.diagnostic.severity.HINT]  = "⚑ ",
      [vim.diagnostic.severity.INFO]  = "! ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Go
vim.lsp.config["gopls"] = {
  cmd = { "gopls" },
  capabilities = capabilities,
  root_dir = vim.fs.root(0, "go.work", "go.mod"),
  settings = {
    gopls = {
      gofumpt = true,
      usePlaceholders = false,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

-- Lua
vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server" },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
    },
  },
}

vim.lsp.enable({ "gopls", "lua_ls" })
