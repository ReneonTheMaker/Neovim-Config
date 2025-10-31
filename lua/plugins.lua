require("lazy").setup({
        {
                "nvim-tree/nvim-tree.lua",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                config = function()
                        require("nvim-tree").setup({
                                view = { width = 30 },
                                filters = { dotfiles = true },
                        })

                        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true })
                end
        },
})
