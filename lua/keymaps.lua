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

-- Git: create and switch to a new branch
vim.keymap.set("n", "<leader>gb", function()
  vim.ui.input({ prompt = "New branch: " }, function(name)
    if not name or name == "" then return end
    local dir = vim.fn.expand("%:p:h")
    if dir == "" then dir = vim.fn.getcwd() end

    local res = vim.system({ "git", "checkout", "-b", name }, { cwd = dir, text = true }):wait()
    if res.code ~= 0 then
      vim.notify(res.stderr, vim.log.levels.ERROR, { title = "git" })
      return
    end
    vim.notify("Switched to " .. name, vim.log.levels.INFO, { title = "git" })
    vim.cmd("checktime")
    pcall(function() require("nvim-tree.api").tree.reload() end)
  end)
end, { desc = "Git: create and switch branch" })

-- Git: stage all, commit, push
vim.keymap.set("n", "<leader>gc", function()
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then dir = vim.fn.getcwd() end

  local function notify(msg, level)
    vim.schedule(function()
      vim.notify(msg, level or vim.log.levels.INFO, { title = "git" })
    end)
  end

  -- write every modified buffer first, or you commit what's on disk,
  -- not what you're looking at
  vim.cmd("silent! wall")

  vim.ui.input({ prompt = "Commit message: " }, function(msg)
    if not msg or msg:match("^%s*$") then
      notify("Aborted", vim.log.levels.WARN)
      return
    end

    local add = vim.system({ "git", "add", "-A" }, { cwd = dir, text = true }):wait()
    if add.code ~= 0 then
      notify(add.stderr, vim.log.levels.ERROR)
      return
    end

    local commit = vim.system({ "git", "commit", "-m", msg }, { cwd = dir, text = true }):wait()
    if commit.code ~= 0 then
      notify((commit.stdout or "") .. (commit.stderr or ""), vim.log.levels.ERROR)
      return
    end

    notify("Committed, pushing…")

    -- async: push is network I/O and will freeze the editor if you :wait() on it
    vim.system({ "git", "push", "-u", "origin", "HEAD" }, { cwd = dir, text = true },
      function(res)
        if res.code ~= 0 then
          notify("Push failed:\n" .. (res.stderr or ""), vim.log.levels.ERROR)
        else
          notify("Pushed")
        end
      end)
  end)
end, { desc = "Git: add all, commit, push" })
