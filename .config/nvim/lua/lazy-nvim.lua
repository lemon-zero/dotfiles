local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local plugins = {
	{ "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		-- Comments
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	},
	-- Colorschemes
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"nyoom-engineering/oxocarbon.nvim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	"ellisonleao/gruvbox.nvim",
	"lunarvim/darkplus.nvim",
	-- Transparency
	"xiyaowong/nvim-transparent",
	-- Status Bar
	"nvim-lualine/lualine.nvim",
	-- Css Colors
	"NvChad/nvim-colorizer.lua",
}
require("lazy").setup("plugins")
