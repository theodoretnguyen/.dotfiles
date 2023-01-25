-- [[ Imports ]]
local luasnip_setup, ls = pcall(require, "luasnip")
if not luasnip_setup then
  return
end

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

  -- Fenced Code Block
  s({ trig = "cb", snippetType = "autosnippet" },
    fmta([[
    ```<>
    <>
    ```
    ]],
      {
        i(1, "language"),
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Centered Image
  s({ trig = "img", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmt([[
    <div style="text-align: center;">
    <img src="{}" width="{}"/>
    </div>
    ]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = line_begin }
  ),

  -- Link
  s({ trig = "LL", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    [<>](<>)
    ]],
      {
        d(1, get_visual),
        i(2),
      }
    ),
    {}
  ),

  -- Bold
  s({ trig = "ttb", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "**<>**",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Italic
  s({ trig = "tti", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "*<>*",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Strikethrough
  s({ trig = "tst", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "~~<>~~",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Inline Math
  s({ trig = "mm", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "$<>$",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Display Math
  s({ trig = "dm", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "$$<>$$",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Fraction
  s({ trig = "ff", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\frac{<>}{<>}",
      {
        d(1, get_visual),
        i(2),
      }
    ),
    {}
  ),

  -- Sum
  s({ trig = "smm", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\sum_{<>}^{<>}",
      {
        i(1),
        i(2),
      }
    ),
    {}
  ),

  -- Vector
  s({ trig = "vv", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\vec{<>}",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Bracket Matrix
  s({ trig = "bmat", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\begin{bmatrix} <> \\end{bmatrix}",
      {
        i(1),
      }
    ),
    {}
  ),

  -- Align*
  s({ trig = "aal", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
    "\\begin{align*} <> \\end{align*}" ,
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Cases
  s({ trig = "case", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta("\\begin{cases} <> \\end{cases}" ,
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Right Arrow
  s({ trig = "rra", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    t("$\\rightarrow$ "),
    {}
  ),

  -- Left Arrow
  s({ trig = "lla", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    t("$\\leftarrow$ "),
    {}
  ),

}
