local found, ls = pcall(require, "luasnip")
if (not found) then return end

-- [[ Luasnip Abbreviations ]]
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- [[ Visual Placeholder ]]
local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

-- [[ Conditional Expansion on New Line]]
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- [[ Snippets ]]
return {

  -- Main Function
  s({ trig = "main", snippetType = "autosnippet" },
    fmta([[
    int main() {
      <>

      return 0;
    }
    ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Generic Regular Function
  s({ trig = "ff", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    <> <>(<>) {
      <>
    }
    ]],
      {
        i(1, "/* returnType */"),
        i(2, "/* functionName */"),
        i(3, "/* parameters */"),
        i(0, "/* functionBody */"),
      }
    ),
    { condition = line_begin }
  ),

  -- Generic Member Function
  s({ trig = "mff", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    <> <>::<>(<>) {
      <>
    }
    ]],
      {
        i(1, "/* returnType */"),
        i(2, "/* className */"),
        i(3, "/* functionName */"),
        i(4, "/* parameters */"),
        i(0, "/* functionBody */"),
      }
    ),
    { condition = line_begin }
  ),

  -- for-loop
  s({ trig = "frl", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    for (<>; <>; <>) {
      <>
    }
    ]],
      {
        i(1, "/* initialization */"),
        i(2, "/* condition */"),
        i(3, "/* update */"),
        i(0, "/* body */"),
      }
    ),
    { condition = line_begin }
  ),

  -- while-loop
  s({ trig = "wll", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    while (<>) {
      <>
    }
    ]],
      {
        i(1, "/* condition */"),
        i(0, "/* body */"),
      }
    ),
    { condition = line_begin }
  ),

  -- do-while-loop
  s({ trig = "dwl", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    do {
      <>
    } while (<>);
    ]],
      {
        i(0, "/* body */"),
        i(1, "/* condition */"),
      }
    ),
    { condition = line_begin }
  ),
}
