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
vim.keymap.set(
        "i",
        "<Tab>",
        function()
                if require("copilot.suggestion").is_visible() then
                        require("copilot.suggestion").accept()
                else
                        return "<Tab>"
                end
        end,
        { expr = true, noremap = true }
)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
        noremap = true, 
        silent = true 
})
