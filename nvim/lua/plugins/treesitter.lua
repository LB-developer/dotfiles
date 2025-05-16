return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'typescript', 'go' },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = {},
        },
        indent = { enable = true },
    },
}
