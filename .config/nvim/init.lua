vim.g.mapleader = " "
vim.opt.number = true
vim.opt.wrap = false
vim.opt.confirm = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Map , to :
for _, mode in ipairs({ "n", "v", "x" }) do
	vim.keymap.set(mode, ",", ":")
end

-- Indent with single key press
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")
-- Keep visual selection upon indent
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Use H/L instead of ^/$
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "g_")

-- Switch tabs with Ctrl-{j,k}
vim.keymap.set("n", "<C-J>", "gT:redraw<BAR>file<CR>")
vim.keymap.set("n", "<C-K>", "gt:redraw<BAR>file<CR>")

-- Switch windows with Ctrl-{h,l}
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-L>", "<C-W>l")

-- Move vertically by visual line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Readline keybindings in cmdline
vim.keymap.set("c", "<C-A>", "<Home>")
vim.keymap.set("c", "<C-F>", "<Right>")
vim.keymap.set("c", "<C-B>", "<Left>")

-- Use 'cp' to copy to system clipboard
vim.keymap.set("v", "cp", '"+y')

-- Macro mode with Q, not q
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "q", "<nop>")

-- Increase macro performance
vim.opt.lazyredraw = true

-- Always keep cursor vertically centered
vim.opt.scrolloff = 99999

-- Undo, backup, swap
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undo//")
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.vim/backup//")
vim.opt.directory = vim.fn.expand("~/.vim/swap//")

-- Better Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse off
vim.opt.mouse = ""

-- Automatically reload files changed on disk
vim.opt.autoread = true
vim.cmd([[
" Help Neovim check if file has changed on disc
" https://github.com/neovim/neovim/issues/2127
augroup checktime
    autocmd!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter,FocusGained,BufEnter,VimResume,VimSuspend,FocusLost,WinLeave * checktime
    endif
augroup END
]])

-- Open files in tabs, not buffers
-- https://vi.stackexchange.com/a/2197
vim.cmd([[
augroup open-tabs
    au!
    au VimEnter * ++nested if !&diff | tab all | tabfirst | endif
augroup end
]])

vim.cmd([[
command XMLFmt %!xmllint "%" --format
]])

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
