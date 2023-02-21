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

-- [[ Conditional Expansion on New Line]]
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- [[ LaTeX-specific Conditional Expansion Functions ]]
local tex = {}
tex.in_env = function(name)
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
tex.in_mathzone = function() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end
tex.in_text = function() return not tex.in_mathzone() end
tex.in_itemize_or_enumerate = function()
    return tex.in_env("itemize") or tex.in_env("enumerate")
end

-- [[ Snippets ]]
return {

  s({ trig = "LL", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("& "),
    }
  ),

  s({ trig = "q", regTrig = false, wordTrig = true },
    {
      t("\\quad "),
    }
  ),

  s({ trig = "qq", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\qquad "),
    }
  ),

  s({ trig = "np", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\newpage"),
    },
    { condition = line_begin }
  ),

  s({ trig = "which", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\text{ for which } "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "for all", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\text{ for all } "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "and", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\quad \\text{and} \\quad"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "toc", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\tableofcontents"),
    },
    { condition = line_begin }
  ),

  s({ trig = "inff", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\infty"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "ii", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    {
      t("\\item "),
    },
    { condition = tex.in_itemize_or_enumerate }
  ),

  s({ trig = "--", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    { t("% --------------------------------------------- %") },
    { condition = line_begin }
  ),

  -- Horizontal Rule
  s({ trig = "hr", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    { t("\\vspace{3ex}\\hrule\\vspace{3ex}") },
    { condition = line_begin }
  ),
}
