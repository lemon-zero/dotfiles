return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v1.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
	config = function()
		local lsp_ok, lsp = pcall(require, "lsp-zero")
		if not lsp_ok then
			return
		end

		lsp.preset("recommended")
		lsp.configure("sumneko_lua", {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		local function lsp_keymaps(bufnr)
			local opts = { noremap = true, silent = true }
			local keymap = vim.api.nvim_buf_set_keymap
			keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
			keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
			keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
			keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
			keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
			keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
		end

		lsp.on_attach(function(client, bufnr)
			if client.name == "tsserver" then
				client.server_capabilities.documentFormattingProvider = false
			end
			if client.name == "sumneko_lua" then
				client.server_capabilities.documentFormattingProvider = true
			end
			lsp_keymaps(bufnr)
		end)

		lsp.setup()
		vim.diagnostic.config({
			virtual_text = true,
			signs = false,
			update_in_insert = false,
			underline = true,
			severity_sort = false,
			float = true,
		})

		local cmp_ok, cmp = pcall(require, "cmp")
		if not cmp_ok then
			return
		end

		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		local cmp_config = lsp.defaults.cmp_config({
			window = {
				completion = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
		})

		cmp.setup(cmp_config)

		local mason_ok, mason = pcall(require, "mason")
		if not mason_ok then
			return
		end

		mason.setup({
			ui = {
				icons = {
					package_installed = "I",
					package_pending = "P",
					package_uninstalled = "U",
				},
			},
		})
	end,
}
