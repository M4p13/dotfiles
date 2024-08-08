local lsp = require('lsp-zero').preset({
	set_lsp_keymaps = true
})
local lspconfig = require('lspconfig')
lspconfig.intelephense.setup({})

lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			diagonostics = {
				globals = {'vim'}
			},
		},
	},
}

-- lspconfig.tsserver.setup {
-- 	settings = {
-- 		inlayHints="all"
-- 	}, 
-- }


lspconfig.svelte.setup {
  on_attach = function(client)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
      end,
    })
  end
}

vim.api.nvim_create_autocmd({"BufWrite"}, {
  pattern = {"+page.server.ts", "+page.ts", "+layout.server.ts", "+layout.ts"},
  command = "LspRestart svelte",
})


local default_setup = function(server_name)
	require('lspconfig')[server_name].setup({})
end

local inlay = function ()
	lspconfig.setup {
		on_attach = function(client, bufnr)
			if client.server_capabilities.inlayHintProvider then
				vim.g.inlay_hints_visible = true
				vim.lsp.buf.inlay_hint(bufnr, true)
			else
				print("no inlay available")
			end

		end
	}
end
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'svelte',
    'gopls',
    'prismals',
    'tsserver',
    'html',
    'lua_ls',
    'eslint',
    "clangd",
    "tailwindcss",
    "dockerls",
    "docker_compose_language_service",
    "pyright",
  },
  handlers = {
    default_setup,
    inlay
  },
  automatic_installation = true
})

vim.keymap.set("n","<leader>gd", function()
  vim.lsp.buf.definition()
end)
vim.keymap.set("n","<leader>gr", function()
  vim.lsp.buf.references()
end)

lsp.setup()
