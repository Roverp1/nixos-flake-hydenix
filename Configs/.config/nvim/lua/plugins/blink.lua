---@module 'blink.cmp'
---@type blink.cmp.Config
local config = {
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	snippets = { preset = "luasnip" },

	keymap = {
		preset = "none",

		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<CR>"] = { "accept", "fallback" },

		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-p>"] = { "snippet_backward", "fallback_to_mappings" },
		["<C-n>"] = { "snippet_forward", "fallback_to_mappings" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},
}

require("blink.cmp").setup(config)
