return {
  -- O 'dir' aponta para a pasta local onde você tá desenvolvendo o plugin
  -- dir = "~/code/json-cheats.nvim",
   url = "https://codeberg.org/rodrigocnascimento/json-cheats.nvim.git",

  -- Exige que o Telescope carregue antes
  dependencies = { "nvim-telescope/telescope.nvim" },

  config = function()
    -- Roda o setup padr�o do seu plugin
    require("json-cheats").setup({
      -- Se quiser mudar a pasta dos JSONs no futuro, é só alterar aqui
      -- path = vim.fn.stdpath("config") .. "/meus_manuais/"
    })

    -- O atalho de ouro injetado assim que o plugin carrega
    vim.keymap.set("n", "<leader>jc", function()
      require("json-cheats").list()
    end, { desc = "Lista Din�mica de Cheatsheets" })
  end,
}
