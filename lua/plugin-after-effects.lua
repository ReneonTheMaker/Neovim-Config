-- Auto-open nvim-tree only for Go projects (safer version)
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if vim.bo.buftype == "directory" or vim.bo.filetype == "NvimTree" then
      return
    end

    -- Only check for .go files in the current working directory
    local handle = io.popen("ls *.go 2>/dev/null | head -c 1")
    local result = handle:read("*a")
    handle:close()

    if result ~= "" then
      require("nvim-tree.api").tree.open()
      vim.cmd("wincmd p")
    end
  end,
})

-- Keep your quit-when-only-tree logic
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd("quit")
    end
  end,
})
-- CMP menu colors
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
vim.api.nvim_set_hl(0, "PmenuSel", { link = "Visual" })
vim.api.nvim_set_hl(0, "PmenuSbar", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "PmenuThumb", { link = "Pmenu" })
