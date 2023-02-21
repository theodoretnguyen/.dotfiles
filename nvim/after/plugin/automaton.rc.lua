-- [[ Imports ]]
local automaton_setup, _ = pcall(require, "cellular-automaton")
if not automaton_setup then
  return
end

-- [[ Keymaps ]]
vim.keymap.set("n", "<leader>Cm", "<cmd>CellularAutomaton make_it_rain<cr>", { silent = true, desc = "Make it rain" })
vim.keymap.set("n", "<leader>Cg", "<cmd>CellularAutomaton game_of_life<cr>", { silent = true, desc = "Game of life" })
