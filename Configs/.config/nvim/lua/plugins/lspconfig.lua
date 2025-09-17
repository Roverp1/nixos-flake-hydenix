local M = {}
local lspconfig = require("lspconfig")

local lsp_servers = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						unpack(vim.api.nvim_list_runtime_paths()), -- works?
					},
				},
				telemetry = { enable = false },
			},
		},
	},

	nixd = {},
}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
}

M.on_attach = function(_, bufnr)
	local map = vim.keymap.set
	local opts = function(desc)
		return { buffer = bufnr, desc = "LSP " .. desc, silent = true }
	end

	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
	-- map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename")) -- doesnt work
end

for lsp, config in pairs(lsp_servers) do
	local default_config = {
		capabilities = M.capabilities,
		on_attach = M.on_attach,
	}
	local final_config = vim.tbl_extend("force", default_config, config)

	lspconfig[lsp].setup(final_config)
end
