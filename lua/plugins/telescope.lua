return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- Usar uma tag fixa garante que o plugin não quebre em atualizações malucas
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- O FZF Native compila um binário em C para o Telescope buscar os arquivos 10x mais rápido
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                -- Trazendo o HUD de Marte para a Busca
                prompt_prefix = " 󰀻  ",
                selection_caret = " 󰄛 ",
                path_display = { "smart" }, -- Encurta caminhos longos de forma inteligente

                -- Mapeamentos dentro da janela do Telescope
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<esc>"] = actions.close, -- Sair direto com ESC (sem entrar no modo normal do Telescope)
                    },
                },
            },
        })

        -- Injeta o motor em C para velocidade máxima
        telescope.load_extension("fzf")

        -- Os Atalhos de Ouro (Ajustados para usar a sua tecla Leader)
        local builtin = require('telescope.builtin')

        -- Busca arquivos pelo nome
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find Files' })

        -- Varre o CONTEÚDO de todos os arquivos do projeto (Live Grep)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live Grep' })

        -- Busca nos arquivos que já estão abertos (Buffers)
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' })

        -- Busca palavras sob o cursor
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope: Grep Word' })
    end
}
