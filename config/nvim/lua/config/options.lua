-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- =============================================================================
-- Tmux Integration Settings
-- =============================================================================

-- Enable true color support in tmux
-- Matches tmux.conf settings: set -ga terminal-overrides ",*256col*:Tc"
if vim.env.TMUX then
  vim.opt.termguicolors = true
end

-- Reduce timeout for key sequences (especially important in tmux)
-- Matches tmux.conf: set -sg escape-time 0
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- Enable focus events for better tmux integration
-- Matches tmux.conf: set -g focus-events on
vim.opt.eventignore:remove("FocusGained")

-- Set clipboard to use system clipboard (works with tmux-yank)
-- Integrates with tmux.conf clipboard settings
vim.opt.clipboard = "unnamedplus"

-- Better split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true
