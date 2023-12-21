require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local servers = {
  "lua_ls",
	"pyright",
	"jsonls",
  "html",
  "cssls",
  "tsserver",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
  -- Add Capabilities
  local	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

  -- Add Server Options
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server = vim.split(server, "@")[1]
	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
