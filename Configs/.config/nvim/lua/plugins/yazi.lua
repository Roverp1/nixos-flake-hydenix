---@type YaziConfig | {}
local config = {
	open_for_directories = true,
	keymaps = {
		show_help = "<f1>",
	},

	init = function()
		-- mark netrw as loaded so it's not loaded at all.
		vim.g.loaded_netrwPlugin = 1
	end,
}

require("yazi").setup()
