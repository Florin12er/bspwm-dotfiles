vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>ls", ":LspStart<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>cl", vim.cmd.HighlightColorsOn)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>lv", vim.cmd.LiveServerStart)
vim.keymap.set("n", "<leader>lq", vim.cmd.LiveServerStop)

vim.keymap.set("n", "gt", ":LazyGit<CR>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_dd]])
vim.keymap.set("n", "<leader>so", function()
	vim.cmd("so")
end)

--telescope
require("telescope").load_extension("emoji")
vim.api.nvim_set_keymap("n", "<leader>ej", ":Telescope emoji<CR>", { noremap = true, silent = true })
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>cs", builtin.colorscheme, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Find > ") })
end)
vim.keymap.set("n", "<leader>o", ":SymbolsOutline<CR>", { noremap = true, silent = true })

--lf
vim.api.nvim_set_keymap("n", "<leader>lf", ":Lf<CR>", { noremap = true, silent = true })

--terminal
-- exit terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- close terminal
vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true })

require("toggleterm").setup({
	shade_terminals = false,
})
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })
--harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<M-1>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<M-2>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<M-3>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<M-4>", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<M-5>", function()
	ui.nav_file(5)
end)

--conform
local conform = require("conform")
vim.keymap.set({ "n", "v" }, "<leader>z", function()
	conform.format({
		async = false,
		timeout_ms = 500,
	})
end)

--px to rem

vim.keymap.set({ "n", "v" }, "<leader>px", ":PxToRemLine<CR>", { noremap = true, silent = true })

--move windows

-- Move to the window to the left
-- vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
-- Move to the window below
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
-- Move to the window above
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
-- Move to the window to the right
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-z>", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-v>", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-q>", "<C-w>q", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-y>", "<C-w>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w>", "<C-w>-", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", "<C-w>>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", "<C-w><", { noremap = true, silent = true })

--codeium

vim.keymap.set("i", "<C-g>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true })
vim.keymap.set("i", "<C-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })
vim.keymap.set("i", "<C-b>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })
vim.keymap.set("i", "<C-l>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })
--lsp
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-he>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- live server
vim.keymap.set("n", "<leader>lv", vim.cmd.LiveServerStart)
vim.keymap.set("n", "<leader>lq", vim.cmd.LiveServerStop)

--git sign
vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.cmd("Gitsigns toggle_signs")
vim.cmd("Gitsigns toggle_current_line_blame")

--neo tree
--vim.keymap.set("n", "<leader>md", ":Neotree toggle<CR>", { noremap = true, silent = true })
