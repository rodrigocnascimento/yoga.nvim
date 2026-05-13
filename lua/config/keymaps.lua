local map = vim.keymap.set

map("n", "<leader>B", function()
  local branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
  if branch ~= "" then
    -- 'echo' é nativo e não depende de interface flutuante
    vim.api.nvim_echo({ { " Branch Atual: " .. branch, "Identifier" } }, true, {})
    -- Limpa a mensagem depois de 3 segundos
    vim.defer_fn(function()
      vim.api.nvim_command('echo ""')
    end, 3000)
  end
end, { desc = "Ver nome da branch atual" })

