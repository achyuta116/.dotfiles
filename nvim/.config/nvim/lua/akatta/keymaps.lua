local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.undotree_SplitWidth = 30

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Navigate harpoon
keymap("n", "<S-l>", ":lua require('harpoon.ui').nav_next()<CR>", opts)
keymap("n", "<S-h>", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
keymap("n", "<leader>hq", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("v", "<leader>hq", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
    , opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)

keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", opts)

-- Formatting using efm
keymap("n", "<leader>r", ":Format<cr>", opts)
