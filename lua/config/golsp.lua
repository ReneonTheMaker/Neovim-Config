require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = { "gopls" },
})

vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
})

vim.diagnostic.config({
        signs = {
                text = {
                        [vim.diagnostic.severity.ERROR] = "✘ ",
                        [vim.diagnostic.severity.WARN] = "▲ ",
                        [vim.diagnostic.severity.HINT] = "⚑ ",
                        [vim.diagnostic.severity.INFO] = "! ",
                },
        },
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
})


vim.lsp.config["gopls"] ={
        settings = {
                gopls = {
                        gofumpt = true,
                        usePlaceholders = true,
                        analyses = {
                                unusedparams = true,
                                shadow = true,
                        },
                },
        },
}

