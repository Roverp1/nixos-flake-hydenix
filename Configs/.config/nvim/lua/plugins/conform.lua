local prittier = { "local_prettier", "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "alejandra" },
		go = { "goimports", "gofmt" },
		css = prittier,
		html = prittier,
		javascript = prittier,
		typescript = prittier,
		javascriptreact = prittier,
		typescriptreact = prittier,
		markdown = prittier,
		json = prittier,
		yaml = prittier,
	},

	format_on_save = {
		timout_ms = 2000,
		lsp_format = "fallback",
	},
})
