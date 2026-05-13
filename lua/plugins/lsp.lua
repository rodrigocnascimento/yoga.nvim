return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "ts_ls" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            -- 1. Injetamos as configurações personalizadas direto no core nativo do Vim
            -- Para Go e TypeScript (que usam as configs padrão), não precisamos declarar nada aqui.
            -- Só precisamos configurar o Lua para ele parar de reclamar da variável global 'vim'.
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })

            -- 2. A ignição nativa do Neovim 0.11+
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("gopls")
            vim.lsp.enable("lua_ls")
        end,
    }
}
