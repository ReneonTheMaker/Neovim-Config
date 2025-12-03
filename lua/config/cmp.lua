local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping(function()
      if cmp.visible_docs() then
        cmp.close_docs()
      elseif cmp.visible() then
        cmp.open_docs()
      else
        vim.lsp.buf.hover()
      end
    end, { "i", "s", "n" }),
    ["<C-w>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.start({
  name = "gopls",
  cmd = {"gopls"},
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
})
