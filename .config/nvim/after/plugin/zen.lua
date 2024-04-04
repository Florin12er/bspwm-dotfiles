require("zen-mode").setup({
	window = {
		backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
		width = 300, -- width of the Zen window
		height = 1, -- heigh0 of the Zen window
		options = {
			signcolumn = "no", -- disable signcolumn
			--number = false, -- disable number column
			-- relativenumber = false, -- disable relative numbers
			--	cursorline = false, -- disable cursorline
			--cursorcolumn = false, -- disable cursor column
			-- foldcolumn = "0", -- disable fold column
			--list = false, -- disable whitespace characters
		},
	},
	plugins = {
		options = {
			enabled = true,
			--ruler = true, -- disables the ruler text in the cmd line area
			showcmd = true, -- disables the command in the last line of the screen
			laststatus = 0, -- turn off the statusline in zen mode
		},
		twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = true }, -- disables git signs
		tmux = { enabled = true }, -- disables the tmux statusline
		alacritty = {
			enabled = true,
			font = "13", -- font size
		},
	},
})
require("twilight").setup({
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
})
