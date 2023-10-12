require 'util'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
	-- specific to C/C++
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lc = require 'lspconfig'

vim.g.markdown_fenced_languages = {
	"ts=typescript"
}
-- lua
-- https://github.com/LuaLS/lua-language-server
-- pacman community repo package
if Which 'lua-language-server' then
	lc.lua_ls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { 'vim' },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	}
end
-- vimscript viml
-- https://github.com/iamcco/vim-language-server
-- npm
if Which 'vim-language-server' then
	lc.vimls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- shell
-- https://www.shellcheck.net
-- pacman community repo package
if Which 'shellcheck' then
	lc.bashls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- typescript
-- https://deno.com
-- pacman community repo
if Which 'deno' then
	lc.denols.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- go
-- https://pkg.go.dev/golang.org/x/tools/gopls
-- pacman community repo
if Which 'gopls' then
	lc.gopls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- python
-- https://github.com/microsoft/pyright
-- pacman community repo package
if Which 'pyright-langserver' then
	lc.pyright.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- c and c++
-- https://github.com/MaskRay/ccls
-- pacman community repo
if Which 'ccls' then
	lc.ccls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- cmake
-- https://github.com/regen100/cmake-language-server
-- pip package
if Which 'cmake-language-server' then
	lc.cmake.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- markdown
-- https://github.com/artempyanykh/marksman
-- pacman aur
if Which 'marksman' then
	lc.marksman.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- latex
-- https://github.com/latex-lsp/texlab
-- pacman community repo package
if Which 'texlab' then
	lc.texlab.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
-- latex and markdown
-- https://github.com/valentjn/ltex-ls
-- pacman aur
if Which 'ltex-ls' then
	lc.ltex.setup {
		filetypes = { "markdown" },
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
