return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    require('core.lsp_keymaps').setup()
    local lsp = require('core.lspconfig')

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            ['local'] = 'your_module_path',
            completeUnimported = true,
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      },
      tsserver = {},
    }

    require('mason').setup()
    require('mason-tool-installer').setup {
      ensure_installed = {
        "lua-language-server",
        "gopls",
        "typescript-language-server",
      }
    }

    require('mason-lspconfig').setup {
      handlers = {
        function(server)
          local config = servers[server] or {}
          config.on_attach = lsp.on_attach
          config.on_init = lsp.on_init
          config.capabilities = lsp.capabilities

          require('lspconfig')[server].setup(config)
        end,
      },
    }
  end,
}

