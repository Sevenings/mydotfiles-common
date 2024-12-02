-- Abbreviations used on the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep



-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end





return {
    -- Example: how to set snippet parameters
    -- s(
    --     { -- Table 1: snippet parameters
    --         trig="hi",
    --         dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
    --         regTrig=false,
    --         priority=100,
    --         snippetType="autosnippet"
    --     },
    --     { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
    --         t("Hello, world!"), -- A single text node
    --     }
    --     -- Table 3, the advanced snippet options, is left blank.
    -- ),

    -- -- Example: how to set snippet parameters
    -- -- Equation
    -- s({trig="eq", dscr="Expands 'eq' into an equation environment"},
    --   fmta(
    --         [[
    --             \begin{equation*}
    --                 <>
    --             \end{equation*}
    --             <>
    --         ]],
    --         { i(1), i(0) }
    --     )
    -- ),

    -- -- Expande no ambiente Begin
    -- s({trig="beg", dscr="Expande no ambiente Begin genérico"},
    --     fmta(
    --         [[
    --             \begin{<>}
    --                 <>
    --             \end{<>}
    --             <>
    --         ]],
    --         { i(1), i(2), rep(1), i(0) }
    --     )
    -- ),

    -- s({trig="for", dscr="For loop Lua"},
    --     fmta(
    --         [[
    --             for <>=<>, <> do
    --                 <>
    --             end
    --             <>
    --         ]],
    --         { i(1, "i"), i(2, "0"), i(3, "n"), d(4, get_visual), i(0) }
    --     )
    -- )
}

