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

  -- Typewriter
  s({ trig = "ttt", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\texttt{<>}",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Italic
  s({ trig = "tti", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\textit{<>}",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Bold
  s({ trig = "ttb", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\textbf{<>}",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Underline
  s({ trig = "ttu", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\underline{<>}",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Smallcaps
  s({ trig = "tts", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\textsc{<>}",
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Math Calligraphy
  s({ trig = "mcc", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "<>\\mathcal{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Math Boldface
  s({ trig = "mbf", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "<>\\mathbf{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- Math Blackboard
  s({ trig = "mbb", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta(
      "<>\\mathbb{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),
}
