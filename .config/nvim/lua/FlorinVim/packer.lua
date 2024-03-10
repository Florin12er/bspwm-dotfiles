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
		{
			"stevearc/conform.nvim",
			event = { "BufReadPre", "BufNewFile" },
		},
		"hrsh7th/cmp-path",
		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
		{ "rose-pine/neovim", name = "rose-pine" },
		"simrat39/symbols-outline.nvim",
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
		"preservim/vim-pencil",
		{
			"folke/twilight.nvim",
			opts = {
				{
					dimming = {
						alpha = 0.25, -- amount of dimming
						color = { "Normal", "#ffffff" },
						term_bg = "#00000000", -- if guibg=NONE, this will be used to calculate text color
						inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
					},
					context = 10, -- amount of lines we will try to show around the current line
					treesitter = true, -- use treesitter when available for the filetype
					expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
						"function",
						"method",
						"table",
						"if_statement",
					},
					exclude = {}, -- exclude these filetypes
				},
			},
		},
		{
			"folke/zen-mode.nvim",
			opts = {
				{
					window = {
						backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
						width = 100, -- width of the Zen window
						height = 1, -- heigh0 of the Zen window
						options = {
							-- signcolumn = "no", -- disable signcolumn
							-- number = false, -- disable number column
							-- relativenumber = false, -- disable relative numbers
							-- cursorline = false, -- disable cursorline
							-- cursorcolumn = false, -- disable cursor column
							-- foldcolumn = "0", -- disable fold column
							-- list = false, -- disable whitespace characters
						},
					},
					plugins = {
						options = {
							enabled = true,
							ruler = false, -- disables the ruler text in the cmd line area
							showcmd = false, -- disables the command in the last line of the screen
							laststatus = 0, -- turn off the statusline in zen mode
						},
						twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
						gitsigns = { enabled = true }, -- disables git signs
						tmux = { enabled = true }, -- disables the tmux statusline
						alacritty = {
							enabled = true,
							font = "+4", -- font size
						},
					},
					on_open = function(win) end,
					on_close = function() end,
				},
			},
		},
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"shaunsingh/nord.nvim",
		"ptzz/lf.vim",
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup()
			end,
		},
		"voldikss/vim-floaterm",
		"amarakon/nvim-cmp-buffer-lines",
		{
			"epwalsh/obsidian.nvim",
			version = "*", -- recommended, use latest release instead of latest commit
			lazy = true,
			ft = "markdown",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			opts = {
				workspaces = {
					{
						name = "personal",
						path = "~/Obsidian/main vault/",
					},
					{
						name = "work",
						path = "~/Obsidian/main vault/",
					},
				},
			},
			notes_subdir = "notes",
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			mappings = {
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
			},
		},
		"hrsh7th/cmp-buffer",
		"ray-x/cmp-treesitter",
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("cyberdream").setup({
					-- Recommended - see "Configuring" below for more config options
					transparent = true,
					italic_comments = true,
					hide_fillchars = true,
					borderless_telescope = true,
				})
			end,
		},
		"xiyaowong/telescope-emoji.nvim",
		{
			"David-Kunz/cmp-npm",
			dependencies = { "nvim-lua/plenary.nvim" },
			ft = "json",
			config = function()
				require("cmp-npm").setup({})
			end,
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
		{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",
			},
			config = function()
				require("codeium").setup({})
			end,
		},
		"ThePrimeagen/vim-be-good",
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
			opts = {
				-- add any options here
			},
			lazy = false,
		},
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		{ "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp" },
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
			config = function()
				vim.keymap.set("i", "<C-c>", function()
					return vim.fn["codeium#Accept"]()
				end, { expr = true, silent = true })
				vim.keymap.set("i", "<c-w>", function()
					return vim.fn["codeium#CycleCompletions"](1)
				end, { expr = true, silent = true })
				vim.keymap.set("i", "<c-s>", function()
					return vim.fn["codeium#CycleCompletions"](-1)
				end, { expr = true, silent = true })
				vim.keymap.set("i", "<c-x>", function()
					return vim.fn["codeium#Clear"]()
				end, { expr = true, silent = true })
			end,
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
		"nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter",
		"windwp/nvim-ts-autotag",
		"ThePrimeagen/harpoon",
		"mbbill/undotree",
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
		{
			"rebelot/terminal.nvim",
			config = function()
				require("terminal").setup()
			end,
		},
	},
})
