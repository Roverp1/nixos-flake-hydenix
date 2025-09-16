local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- "christoomey/vim-tmux-navigator"
map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Select left nvim/tmux pane" })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Select bottom nvim/tmux pane" })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Select bottom nvim/tmux pane" })
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Select bottom nvim/tmux pane" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<leader>sa", "ggVG", { desc = "󰒆 Select All" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

-- Comment ?
-- map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
-- map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("n", "x", '"_x', { desc = "Save deleted character to the underlying register" })

-- Global LSP ?
-- map("i", "jl", function()
--   require("cmp").close()
-- end, { desc = "Hide LSP popup menu in insert mode" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in current buffer" })

-- yazi.nvim
map("n", "<C-n>", "<cmd>Yazi toggle<cr>", { desc = "Yazi toggle" })
map("n", "<leader>yw", "<cmd>Yazi cwd<cr>", { desc = "Yazi open at working directory" })
map("n", "<leader>yf", "<cmd>Yazi<cr>", { desc = "Yazi open at current file" })

map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Find all files" }
)

-- remaps for centring
map("n", "<C-d>", "<C-d>zz", { desc = "Jump half a page down and center the screeen" })
map("n", "<C-u>", "<C-u>zz", { desc = "Jump half a page up and center the screeen" })

map("n", "n", "nzz", { desc = "Jump to the next occurence of the word and center the screeen" })
map("n", "N", "Nzz", { desc = "Jump to the privous occurence of the word and center the screeen" })

map("n", "*", "*zz", { desc = "Jump to the next occurence of the current word and center the screeen" })
map("n", "#", "#zz", { desc = "Jump to the preivous occurence of the current word and center the screeen" })

map("n", "{", "{zz", { desc = "Jump to the start of the block and center the screeen" })
map("n", "}", "}zz", { desc = "Jump to the end of the block and center the screeen" })
