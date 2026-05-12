-- lua/config/cmp.lua
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
    ["<C-d>"] = cmp.mapping(function()
      if cmp.visible_docs() then
        cmp.close_docs()
      elseif cmp.visible() then
        cmp.open_docs()
      else
        vim.lsp.buf.hover()
      end
    end, { "i", "s" }),

    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-w>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  })
})

-- Make sure capabilities are available globally for lsp.lua
_G.cmp_nvim_lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
