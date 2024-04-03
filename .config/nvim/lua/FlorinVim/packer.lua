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
require("lazy").setup({
	{
		"hrsh7th/cmp-path",
		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
		{ "rose-pine/neovim", name = "rose-pine" },
		"nvimtools/none-ls.nvim",
		"nyoom-engineering/oxocarbon.nvim",
		"kwakzalver/duckytype.nvim",
		{
			"mrjones2014/tldr.nvim",
			dependencies = { "nvim-telescope/telescope.nvim" },
		},
		"David-Kunz/gen.nvim",
		"xiyaowong/transparent.nvim",
		"simrat39/symbols-outline.nvim",
		{
			"kevinhwang91/nvim-ufo",
			dependencies = "kevinhwang91/promise-async",
		},
		{ "EdenEast/nightfox.nvim" },
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {},
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},
		"vimwiki/vimwiki",
		"preservim/vim-pencil",
		"folke/twilight.nvim",
		"folke/zen-mode.nvim",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"Mofiqul/dracula.nvim",
		"shaunsingh/nord.nvim",
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
		},
		"voldikss/vim-floaterm",
		--neorg
		{
			"vhyrro/luarocks.nvim",
			priority = 1000, -- We'd like this plugin to load first out of the rest
			config = true, -- This automatically runs `require("luarocks-nvim").setup()`
		},
		"nvim-neorg/neorg-telescope",
		"nvim-neorg/norg-specs",
		{
			"nvim-neorg/neorg",
			build = ":Neorg sync-parsers",
			lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
			-- tag = "*",
			dependencies = {
				"nvim-neorg/norg-specs",
				"nvim-lua/plenary.nvim",
				"nvim-neorg/neorg-telescope",
				"luarocks.nvim",
			},
		},
		"amarakon/nvim-cmp-buffer-lines",
		{
			"epwalsh/obsidian.nvim",
			version = "*", -- recommended, use latest release instead of latest commit
			lazy = true,
			ft = "markdown",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		"hrsh7th/cmp-buffer",
		"ray-x/cmp-treesitter",
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
		},
		"xiyaowong/telescope-emoji.nvim",
		{
			"David-Kunz/cmp-npm",
			dependencies = { "nvim-lua/plenary.nvim" },
			ft = "json",
		},
		"amarakon/nvim-cmp-fonts",
		"hrsh7th/cmp-emoji",
		"mfussenegger/nvim-jdtls",
		"lewis6991/gitsigns.nvim",
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
		"nvim-lua/plenary.nvim",
		"akai54/2077.nvim",
		"uga-rosa/cmp-dictionary",
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},
		"maxmellon/vim-jsx-pretty",
		{ "decaycs/decay.nvim", as = "decay" },
		"marko-cerovac/material.nvim",
		"onsails/lspkind.nvim",
		{
			"barrett-ruth/live-server.nvim",
			build = "npm global add live-server",
			config = true,
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.5",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"jsongerber/nvim-px-to-rem",
			config = true,
		},
		{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",
			},
		},
		"nvim-lua/plenary.nvim",
		"brenoprata10/nvim-highlight-colors",
		"nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter",
		"windwp/nvim-ts-autotag",
		"ThePrimeagen/harpoon",
		"mbbill/undotree",
		{
			"kdheepak/lazygit.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},

		{
			"numToStr/Comment.nvim",
			lazy = false,
		},
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
				"saadparwaiz1/cmp_luasnip",
			},
		},
		"nvim-tree/nvim-web-devicons",
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		"maxmellon/vim-jsx-pretty",
		"onsails/lspkind.nvim",
		{
			"barrett-ruth/live-server.nvim",
			build = "npm global add live-server",
			config = true,
		},
		{ "rafamadriz/friendly-snippets" },
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.5",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"jsongerber/nvim-px-to-rem",
			config = true,
		},
		{
			"Exafunction/codeium.vim",
		},
		{ "christoomey/vim-tmux-navigator", lazy = false },
		"ThePrimeagen/vim-be-good",
		"nvim-lua/plenary.nvim",
		{
			"2kabhishek/nerdy.nvim",
			dependencies = {
				"stevearc/dressing.nvim",
				"nvim-telescope/telescope.nvim",
			},
			cmd = "Nerdy",
		},
		{
			"goolord/alpha-nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},
		"brenoprata10/nvim-highlight-colors",
		"nvim-treesitter/nvim-treesitter",
		"windwp/nvim-ts-autotag",
		"ThePrimeagen/harpoon",
		"mbbill/undotree",
		{
			"vim-test/vim-test",
			dependencies = {
				"preservim/vimux",
			},
		},
		"tpope/vim-fugitive",
		"norcalli/nvim-colorizer.lua",
		{
			"numToStr/Comment.nvim",
			lazy = false,
		},
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		"nvim-tree/nvim-web-devicons",
		"rebelot/terminal.nvim",
	},
})
