local setup, ls = pcall(require, "luasnip")
if (not setup) then return end

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

  -- Superscript
  s({ trig =  "([%w%)%]%}])'", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>^{<>}",
      {
        f(function(_,snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Subscript
  s({ trig = "([%w%)%]%}]);", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>_{<>}",
      {
        f(function(_,snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Subscript and Superscript
  s({ trig = "([%w%)%]%}])__", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>_{<>}^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Superscript Shortcut
  -- Places the first alphanumeric character after the trigger into a superscript
  s({ trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end),
      }
    ),
    {condition = tex.in_mathzone}
  ),

  -- Subscript Shortcut
  -- Places the first alphanumeric character after the trigger into a subscript
  s({ trig = '([%w%)%]%}]):([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Zero Subscript Shortcut
  s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("0"),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Vector
  s({ trig = "vv", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\vec{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
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
    { condition = tex.in_mathzone }
  ),

  -- Absolute Value
  s({ trig = "aa", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\abs{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Square Root
  s({ trig = "sq", regTrig = false, wordTrig = true, snippetType ="autosnippet" },
    fmta(
      "\\sqrt{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Logarithm with base subscript
  s({ trig = "log", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\log_{<>}",
      {
        i(1),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Sum with lower limit
  s({ trig = "sM", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\sum_{<>}",
      {
        i(1),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Sum with upper and lower limit
  s({ trig = "smm", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\sum_{<>}^{<>}",
      {
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Product with lower limit
  s({ trig = "pD", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\prod_{<>}",
      {
        i(1),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Product with upper and lower limit
  s({ trig = "pdd", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\prod_{<>}^{<>}",
      {
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Limit
  s({ trig = "lim", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\lim_{<> \\to <>}",
      {
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Derivative with denominator only
  s({trig = "dV", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "\\frac{d}{d<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Derivative with numerator and denominator
  s({trig = "dvv", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "\\frac{d<>}{d<>}",
      {
        i(1),
        i(2)
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Derivative with numerator, denominator, and higher-order argument
  s({trig = "ddv", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "\\frac{d^{<>}<>}{d<>^{<>}}",
      {
        i(1),
        i(2),
        i(3),
        rep(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),

  -- Integral with upper and lower limit
  s({ trig = "intt", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\int_{<>}^{<>}",
      {
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Boxed command
  s({trig = "bb", regTrig = false, wordTrig = true, snippetType = "autosnippet"},
    fmta(
      "\\boxed{<>}",
      {
        d(1, get_visual)
      }
    ),
    {condition = tex.in_mathzone}
  ),

  -- [[ Static Math Snippets ]]

  -- Single Integral
  s({ trig = "in1", snippetType = "autosnippet" },
    {
      t("\\int"),
    },
    { condition = tex.in_mathzone }
  ),

  -- Double Integral
  s({ trig = "in2", snippetType = "autosnippet" },
    {
      t("\\iint"),
    },
    { condition = tex.in_mathzone }
  ),

  -- Triple Integral
  s({ trig = "in3", snippetType = "autosnippet" },
    {
      t("\\iiint"),
    },
    { condition = tex.in_mathzone }
  ),

  -- cdots
  s({trig = "cdd", snippetType="autosnippet"},
    {
      t("\\cdots"),
    }
  ),

  -- ldots
  s({trig = "ldd", snippetType="autosnippet"},
    {
      t("\\ldots"),
    }
  ),

  -- equiv
  s({trig = "eqq", snippetType="autosnippet"},
    {
      t("\\equiv "),
    }
  ),

  -- setminus
  s({trig = "stm", snippetType="autosnippet"},
    {
      t("\\setminus "),
    }
  ),

  -- subset
  s({trig = "sbb", snippetType="autosnippet"},
    {
      t("\\subset "),
    }
  ),

  -- approx
  s({trig = "apx", snippetType="autosnippet"},
    {
      t("\\approx "),
    },
    {condition = tex.in_mathzone}
  ),

  -- propto
  s({trig = "pt", snippetType="autosnippet"},
    {
      t("\\propto "),
    },
    {condition = tex.in_mathzone}
  ),

  -- colon
  s({trig = "::", snippetType="autosnippet"},
    {
      t("\\colon "),
    }
  ),

  -- implies
  s({trig = ">>", snippetType="autosnippet"},
    {
      t("\\implies "),
    }
  ),

  -- Dot Product
  s({trig = ",.", snippetType="autosnippet"},
    {
      t("\\cdot "),
    }
  ),

  -- Cross Product
  s({trig = "xx", snippetType="autosnippet"},
    {
      t("\\times "),
    }
  ),
}
