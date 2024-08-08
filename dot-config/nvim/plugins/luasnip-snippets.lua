
-- Luasnip configurations
-----------------------------

local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


-- My Snippets
------------------

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "today",
            namr = "Today",
            dscr = "Today's date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),

        snip({
            trig = "and",
            namr = "And -> &&",
            dscr = "Replaces 'and' by '&&'. Never more writing symbols! Joys to the natural language speech!",
        }, {
            func(function() return "&& " end, {}),
        }),

        snip({
            trig = "or",
            namr = "Or -> ||",
            dscr = "Replaces 'or' by '||'. Never more writing symbols! Joys to the natural language speech!",
        }, {
            func(function() return "|| " end, {}),
        }),
    },
})
