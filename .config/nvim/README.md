# My Neovim Configuration

Welcome to my Neovim configuration! This setup is tailored for enhanced productivity and an optimized coding experience. Below, you'll find details about the plugins, configurations, and key remappings I've implemented.

# Table of Contents

- [Neovim Configuration](#neovim-configuration)
  - [Installation](#installation)
  - [Plugin Manager](#plugin-manager)
  - [Language Server Protocol (LSP) and Autocomplete](#language-server-protocol-lsp-and-autocomplete)
  - [File Navigation](#file-navigation)
  - [Code Highlighting and Color Scheme](#code-highlighting-and-color-scheme)
  - [Additional Plugins](#additional-plugins)
  - [Key Remappings](#key-remappings)
    - [Explanation of key remappings](#explanation-of-key-remappings)
  - [Set up Language Servers](#set-up-language-servers)
  - [Customize Further (Optional)](#customize-further-optional)

## Plugin Manager

I use `lazy.nvim` as my plugin manager, simplifying plugin management and maintaining a well-organized Neovim setup.

## Language Server Protocol (LSP) and Autocomplete

I've configured LSP for various languages using `mason`, `mason-lsp-config`, and `lspconfig`. Autocompletion is handled by `nvim-cmp` with the `cmp-snippy` engine.

I use `conform.nvim` for code formatting and `nvim-highlight-colors` for color highlighting in CSS, HTML, and Tailwind.

## File Navigation

For file navigation, I use `nvim-tree` and `nvim-telescope` for fuzzy finding. Additionally, `harpoon` simplifies navigation and manages persistent terminals.

## Code Highlighting and Color Scheme

I've chosen the `tokyonight` color scheme for a visually appealing coding environment.

## Additional Plugins

- **Fugitive:** A premier Git plugin for Vim.
- **undotree:** Visualizes the undo history and allows easy navigation between different undo branches.
- **vim-be-good:** A game to improve Neovim skills.
- **nvim-lsp-ts-autotag:** Uses treesitter to autoclose and autorename HTML tags.
- **codeium:** An AI-powered autocompletion plugin, considered essential for an enhanced coding experience.check the [README] https://github.com/Exafunction/codeium.vim for more details.
- **nvim-ufo:** A plugin for managing folds in Neovim. press zr to unfold and zm to fold.
- **Comment.nvim:** A plugin for commenting code in Neovim type `gcc` to comment a line or `gbc` to comment a block.

## Installation

1. **Install Neovim**:
   Make sure you have Neovim installed on your system. You can find installation instructions on the official Neovim website: https://neovim.io/.

2. **you just need to type this command in your terminal**:

```bash
git clone git@github.com:Florin12er/my-neovim-setup.git ~/.config/nvim
```

**for Windows users**:

```powershell
mkdir "$env:USERPROFILE\AppData\Local\nvim" -Force; git clone https://github.com/Florin12er/my-neovim-setup.git "$env:USERPROFILE\AppData\Local\nvim"
```

3. **Start Neovim**:

```bash
nvim
```

4. **open the file in the file manager(Optional)**:

```bash
nautilus .config/nvim/
```

**Windows users**:

```powershell
explorer "$env:USERPROFILE\AppData\Local\nvim"
```

## Key Remappings

```lua
vim.g.mapleader = " "

vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>md", ":NvimTreeFindFileToggle<CR>")
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":_dP", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":!chmod +x %<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_dd]])
```

## Explanation of key remappings

- **vim.g.mapleader = " "**: Sets the leader key to a space.

- **space + w**: Saves the current buffer.

- **space + q**: Closes the current buffer.

- **space + wq**: Saves and closes the current buffer.

- **space + md**: Toggles the NvimTree file explorer.

- **J**: In visual mode, moves the selected lines down by one.

- **K**: In visual mode, moves the selected lines up by one.

- **J**: In normal mode, joins the current line with the line below and repositions the cursor at the start of the joined line.

- **<C-d>**: In normal mode, scrolls down by half a screen and centers the cursor line.

- \*_<C-u>_: In normal mode, scrolls up by half a screen and centers the cursor line.

- **space + x**: Executes the current file as an executable.

- **space + p**: Replaces the current line with the contents of the clipboard.

- **space + s**: Replaces all instances of the word under the cursor with the contents of the clipboard.

- **space + d**: Deletes the current line and does not add it to the yank register.

for more of my remappings, check the **remap.lua** file from the **lua/FlorinVim folder**. feel free to add more key remappings

## Enjoy!

Start Neovim, and Lazy.nvim will automatically install the configured plugins.

## Set up Language Servers

Depending on the languages you work with, you may need to install language servers and configure them. Refer to the documentation of mason, mason-lsp-config, and lspconfig for more information.

## Customize Further (Optional)

Feel free to explore and customize the configuration according to your preferences.
ef you encounter azy issues or have questions, don't hesitate to open an issue on this repository.
