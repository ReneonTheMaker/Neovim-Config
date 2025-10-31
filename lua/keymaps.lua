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
