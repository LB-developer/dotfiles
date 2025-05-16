local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

-- Clean up stale registrations
ls.cleanup()

ls.add_snippets('lua', {
  s('banana', { t "print('banana')" }, { show_condition = nil }),
})
