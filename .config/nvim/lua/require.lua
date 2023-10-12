vim.opt.diffopt:append('horizontal')

require 'lazy'.setup({
	"neovim/nvim-lspconfig",
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
})
