vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.mouse = "v"
vim.o.expandtab = true
vim.o.number = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.o.wrap = false
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.o.wrap = false
    vim.o.relativenumber = true
  end,
})
vim.cmd("colorscheme retrobox")
-- background transparent
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
