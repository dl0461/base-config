local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git", "clone", "--depth", "1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print 'Installing packer close and reopen Neovim...'
	vim.cmd 'packadd packer.nvim'
end
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end
local use = packer.use

packer.startup {
	{},
	config = {
		display = {
			open_fn = require('packer.util').float,
		}
	},
}

use "wbthomason/packer.nvim"

use "lukas-reineke/indent-blankline.nvim"
use "mfussenegger/nvim-jdtls"
use "neovim/nvim-lspconfig"
use "tpope/vim-surround"

use {
	"nvim-telescope/telescope.nvim",
	requires = {
		use 'nvim-lua/plenary.nvim'
	}
}

if PACKER_BOOTSTRAP then packer.sync() end
