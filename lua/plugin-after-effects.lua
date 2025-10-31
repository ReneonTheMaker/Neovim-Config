-- Auto-open nvim-tree if the current folder contains any .go files
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local handle = io.popen("ls *.go 2>/dev/null")
    local result = handle:read("*a")
    handle:close()

    if result ~= "" then
      vim.cmd("NvimTreeOpen")
      vim.cmd("wincmd p")
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    -- Check if only one window is left
    if vim.fn.winnr("$") == 1 then
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname:match("NvimTree_") then
        vim.cmd("quit")
      end
    end
  end,
})
