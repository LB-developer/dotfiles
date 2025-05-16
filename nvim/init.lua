-- Set leader key (must be before plugins)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load core settings
require 'core.options'
require 'core.keymaps'
require 'core.autocmds'

-- Initialize plugin manager
require 'core.lazy'
