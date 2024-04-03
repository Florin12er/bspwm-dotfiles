require("neorg").setup({
	filetypes = { "norg", "org" },
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.integrations.telescope"] = {},
		["core.export"] = {},
		["core.integrations.treesitter"] = {},
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/notes",
				},
			},
		},
	},
})
