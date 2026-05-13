return {
    "rodrigocnascimento/doom-hud.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Chama o setup que revisamos, que agora ├® limpo e funcional
        require("doom_hud").setup()
    end,
}
