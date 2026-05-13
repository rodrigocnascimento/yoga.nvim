-- ~/.config/nvim/lua/config/lazy.lua

-- 1. Bootstrap do lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Configura os plugins (Seu tema local + Lualine)
require("lazy").setup({
  -- Isso aqui manda o Lazy ler tudo que tá dentro de ~/.config/nvim/lua/plugins/
    { import = "plugins" },
}, {
  -- Opções visuais do gerenciador para não poluir sua tela
  ui = {
    border = "single",
    icons = {
      cmd = "⌘", config = "🛠", event = "📅", ft = "📂", init = "⚙",
      import = "📦", keys = "🗝", plugin = "🔌", runtime = "💻",
      require = "🌙", source = "📄", start = "🚀", task = "📌", lazy = "💤 ",
    },
  },
})
