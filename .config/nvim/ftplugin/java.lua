require 'util'

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- pacman aur
if which("jdtls") then

	local jdtls = require 'jdtls'
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true }

		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

		vim.diagnostic.config({
			underline = false,
			virtual_text = false,
			signs = false,
		})

		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'ds', vim.lsp.buf.document_symbol, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)

		jdtls.setup.add_commands()
		-- java
		vim.keymap.set('n', '<space>di', jdtls.organize_imports, opts)
	end
	-- vim.fn.getcwd()
	-- jdtls.setup.find_root({ '.git', 'gradlew' })
	local workspace_dir = '/home/daniel/.working'
	local jdtls_dir = os.getenv('HOME') .. '/.local/share/jdtls'
	-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
	local config = {
		cmd = {
			'java',
			'-Declipse.application=org.eclipse.jdt.ls.core.id1',
			'-Dosgi.bundles.defaultStartLevel=4',
			'-Declipse.product=org.eclipse.jdt.ls.core.product',
			'-Dlog.protocol=true',
			'-Dlog.level=ALL',
			'-Xms1g',
			'--add-modules=ALL-SYSTEM',
			'--add-opens', 'java.base/java.util=ALL-UNNAMED',
			'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
			'-jar', jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
			'-configuration', jdtls_dir .. '/config_linux',
			'-data', workspace_dir
		},
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = workspace_dir,
	}
	jdtls.start_or_attach(config)
end
