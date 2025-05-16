local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.cleanup()
ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
}

ls.add_snippets("typescriptreact", {
    s("new_component_with_props", fmt([[
      interface Props {{
        {}: {};
        {}: {};
      }}

      export default function {}({{ {}, {} }}: Props) {{
        return (
          <>
          </>
        );
      }}
    ]], {
      i(1, "prop1name"),
      i(2, "prop1type"),
      i(3, "prop2name"),
      i(4, "prop2type"),
      i(5, "NewComponent"),
      rep(1),
      rep(3),
    }))
})
