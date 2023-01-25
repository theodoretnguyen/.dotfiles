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

-- [[ LaTeX-specific Conditional Expansion Functions ]]
local tex = {}
tex.in_mathzone = function() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- [[ Snippets ]]
return {

  -- Left/Right Parentheses
  s({trig = "l(", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "<>\\left(<>\\right)",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- Left/Right Square Brackets
  s({trig = "l[", regTrig = false, wordTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\left[<>\\right]",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- Left/Right Curly Braces
  s({trig = "l{", regTrig = false, wordTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\left\\{<>\\right\\}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- Big Parenthesis
  s({trig = "b(", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "<>\\big(<>\\big)",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- Big Square Brackets
  s({trig = "b[", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "<>\\big[<>\\big]",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- Big Curly Braces
  s({trig = "b{", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "<>\\big\\{<>\\big\\}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- Escaped Curly Braces
  s({trig = "\\{", regTrig = false, wordTrig = true, snippetType = "autosnippet", priority = 2000},
    fmta(
      "<>\\{<>\\}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- LaTeX Quotation Marks
  s({trig = "``", snippetType = "autosnippet"},
    fmta(
      "``<>''",
      {
        d(1, get_visual),
      }
    )
  ),
}
