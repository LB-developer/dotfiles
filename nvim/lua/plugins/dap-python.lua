return {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    keys = {
        {
            '<leader>dPt',
            function()
                require('dap-python').test_method()
            end,
            desc = 'Debug Method',
        },
        {
            '<leader>dPc',
            function()
                require('dap-python').test_class()
            end,
            desc = 'Debug Class',
        },
    },
    config = function()
        local path = vim.fn.has 'win32' == 1 and '/venv/Scripts/pythonw.exe' or '/venv/bin/python'
        require('dap-python').setup(path)
    end,
}
