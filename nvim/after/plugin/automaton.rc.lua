local found, _ = pcall(require, "cellular-automaton")
if (not found) then return end

-- [[ Keymaps ]]
vim.keymap.set("n", "<leader>Cm", "<cmd>CellularAutomaton make_it_rain<cr>", { desc = "Make it rain" })
vim.keymap.set("n", "<leader>Cg", "<cmd>CellularAutomaton game_of_life<cr>", { desc = "Game of life" })
