return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local status_ok, doom_lualine = pcall(require, "doom_hud.lualine")
        if status_ok then
            require("lualine").setup(doom_lualine.get_config())
        end
    end,
}
