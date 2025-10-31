require("lazy").setup({
    -- Tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = { width = 30 },
                filters = { dotfiles = true },
            })

            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
                noremap = true, 
                silent = true 
            })
        end
    },
    -- Github Copilot
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true, auto_trigger = true },
                panel = { enabled = false },
            })
        end,
    },

})
