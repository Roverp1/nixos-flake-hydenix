local opt = vim.opt
local g = vim.g

opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

opt.laststatus = 3
opt.splitkeep = "screen"

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "number"

-- Indentation
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.fillchars = { eob = " " }
opt.mouse = "a"

opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.timeoutlen = 500
opt.undofile = true

opt.splitbelow = true
opt.splitright = true

opt.updatetime = 250 -- ?
opt.whichwrap:append("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
