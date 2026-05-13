-- ~/.config/nvim/lua/config/options.lua

-- Define a tecla Leader como Espaço
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Interface e Comportamento Brutal
vim.opt.number = true         -- Ativa números de linha
vim.opt.relativenumber = true -- Números relativos (essencial para saltar linhas no Vim)
vim.opt.termguicolors = true  -- Ativa suporte a 24-bit RGB (obrigatório para os tons de Marte)
vim.opt.mouse = "a"           -- Permite usar o mouse se precisar dar um scroll rápido
vim.opt.laststatus = 3        -- faz aparecer a barra global
-- Abas e Indentação (Padrão limpo de 2 espaços)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Visual Clean: Esconde os tils (~) das linhas vazias no fim do buffer
-- Sem strings complexas para não dar "Invalid Argument" no nvim 0.12
-- vim.opt.fillchars = {
--   eob = " ",
-- }


-- Se estiver no WSL, o Neovim precisa saber como falar com o Windows:
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r`n\", \"`n\"))",
            ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r`n\", \"`n\"))",
        },
        cache_enabled = 0,
    }
end

-- Reduz a espera do Neovim por sequências de escape no terminal do Windows
vim.opt.ttimeoutlen = 10
vim.opt.timeoutlen = 300

-- Melhora a velocidade de resposta no WSL/Windows Terminal
vim.opt.updatetime = 250  -- Salva swap e dispara eventos mais rápido
vim.opt.redrawtime = 1500 -- Evita que o Nvim pare de desenhar a tela em arquivos grandes
