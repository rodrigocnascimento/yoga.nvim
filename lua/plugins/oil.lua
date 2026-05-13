return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            -- Diz para o Neovim que o Oil é o chefe, matando o netrw antigo
            default_file_explorer = true,

            -- Limpando a interface para ficar direto ao ponto
            columns = {
                "icon",
                -- "permissions", (descomente se quiser ver permissões de arquivo)
                -- "size",
                -- "mtime",
            },
            view_options = {
                show_hidden = true, -- Mostrar arquivos ponto (.env, .gitignore)
            },
            -- Atalhos embutidos quando você está dentro do buffer do Oil
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-h>"] = "actions.select_split",
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-c>"] = "actions.close",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
            },
        })

        -- O Atalho de Ouro: Aperte '-' no modo normal para abrir a pasta atual
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir diretório pai" })
    end,
}
