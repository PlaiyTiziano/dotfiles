-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function _G.Get_test_cmd( --[[optional]]line)
  local file_path = vim.fn.expand("%")
  local project_root = vim.fn.getcwd()
  local relative_path = file_path:gsub(project_root .. "/", "", 1)

  local line_number = vim.api.nvim_win_get_cursor(0)[1]

  if line then
    return "bundle exec rspec " .. relative_path .. ":" .. line_number
  else
    return "bundle exec rspec " .. relative_path .. " --no-fail-fast"
  end
end

function _G.Connect_to_nipro_web_container(test_cmd)
  return "execute_api_command -it '" .. test_cmd .. "'"
end

vim.keymap.set(
  "n",
  "<leader>testf",
  "<cmd>lua require('FTerm').run({ Connect_to_nipro_web_container(Get_test_cmd()) })<CR>",
  { noremap = true, desc = "Test current file" }
)
vim.keymap.set(
  "n",
  "<leader>testl",
  ":lua require('FTerm').run({ Connect_to_nipro_web_container(Get_test_cmd(true)) })<CR>",
  { noremap = true, desc = "Test current line" }
)
vim.keymap.set("n", "<C-t>", "<cmd>lua require('FTerm').toggle()<CR>", { noremap = true, desc = "Toggle FTerm" })
vim.keymap.set("n", "<C-p>", "<cmd>lua Snacks.picker.files()<CR>", { noremap = true, desc = "Find files (Root dir)" })
vim.keymap.set(
  "n",
  "<leader>fs",
  "<cmd>lua Snacks.picker.lsp_symbols()<CR>",
  { noremap = true, desc = "Find LSP Symbols" }
)
vim.keymap.set(
  "n",
  "<leader>gr",
  "<cmd>lua Snacks.picker.lsp_references()<CR>",
  { noremap = true, desc = "Find LSP references" }
)
vim.keymap.set("n", "<leader>yF", "<cmd>let @+ = expand('%:~:.')<cr>", { desc = "Relative Path", silent = true })
vim.keymap.set("n", "<leader>yf", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Full Path", silent = true })
