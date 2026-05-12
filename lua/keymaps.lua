vim.g.mapleader = ","
vim.keymap.set(
  "n", 
  "<leader>t", 
  ":vsplit | wincmd L | terminal<CR>a", 
  { 
    noremap = true, 
    silent = true
  }
)
vim.keymap.set(
  "n",
  "<leader>T",
  ":split | terminal<CR>a",
  {
    noremap = true,
    silent = true,
  }
)

vim.keymap.set(
  "n",
  "<C-s>",
  ":w<CR>",
  {
    noremap = true,
    silent = true,
  }
)

vim.keymap.set(
  "n",
  "<C-b>",
  ":!go run .<CR>",
  {
    noremap = true,
    silent = true,
  }
)

vim.keymap.set(
  "t",
  "<Esc>",
  [[<C-\><C-n>]],
  { noremap = true }
)
vim.keymap.set(
  "n", "q:", "<Nop>"
)
vim.keymap.set(
  "n", "q/", "<Nop>"
)
vim.keymap.set(
  "n", "q?", "<Nop>"
)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
  noremap = true, 
  silent = true 
})
vim.keymap.set("n", "<C-d>", function()
    vim.lsp.buf.hover()
end, { silent = true, desc = "Show docs" })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd("silent! lua vim.lsp.buf.format()")
  end,
})
