require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
})

vim.lsp.config["lua_ls"] ={
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { '/init.lua' }, { '.luarc.jsonc' }, '.git' },

  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}

vim.lsp.enable("lua_ls")
