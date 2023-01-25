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

-- [[ LaTeX-specific Conditional Expansion Functions ]]
local tex = {}
tex.in_mathzone = function() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- [[ Snippets ]]
return {

  -- Generic Environment
  s({ trig = "new", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
  fmta([[
  \begin{<>}
      <>
  \end{<>}
  ]],
      {
        i(1),
        d(2, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  -- Environment with one extra argument
  s({ trig = "n2", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
  fmta([[
  \begin{<>}{<>}
      <>
  \end{<>}
  ]],
      {
        i(1),
        i(2),
        d(3, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  -- Environment with two extra arguments
  s({ trig = "n3", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
  fmta([[
  \begin{<>}{<>}{<>}
      <>
  \end{<>}
  ]],
      {
        i(1),
        i(2),
        i(3),
        d(4, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  -- Equation
  s({ trig = "eqn", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{equation}
        <>
    \end{equation}
    ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Equation*
  s({ trig = "eeq", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{equation*}
        <>
    \end{equation*}
    ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Split Equation
  s({ trig = "eqs", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{equation*}
        \begin{split}
            <>
        \end{split}
    \end{equation*}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),

  -- Align
  s({ trig = "ali", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{align}
        <>
    \end{align}
    ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Align*
  s({ trig = "aal", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{align*}
        <>
    \end{align*}
    ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Itemize
  s({ trig = "item", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{itemize}
        \item <>
    \end{itemize}
    ]],
      {
        i(0),
      }),
    { condition = line_begin }
  ),

  -- Enumerate
  s({ trig = "enum", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{enumerate}
        \item <>
    \end{enumerate}
    ]],
      {
        i(0),
      }),
    { condition = line_begin }
  ),

  -- Frame
  s({ trig = "fram", regTrig = false, snippetType = "autosnippet" },
    fmta([[
    \begin{frame}{<>}{<>}
        <>
    \end{frame}
    ]],
      {
        i(1),
        i(2),
        i(0),
      }),
    { condition = line_begin }
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
      "\\[<>\\]",
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
    { condition = tex.in_mathzone }
  ),

  -- Cases
  s({ trig = "case", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{cases}
        <>
    \end{cases}
    ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- Image
  s({ trig = "img", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \includegraphics[width=<>\linewidth]{<>}
    ]],
      {
        i(1),
        i(2),
      }
    ),
    {}
  ),

  -- Figure
  s({ trig = "fig", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \begin{figure}[htb!]
        \centering
        \includegraphics[width=<>\linewidth]{<>}
        \caption{<>}
        \label{fig:<>}
    \end{figure}
    ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    ),
    { condition = line_begin }
  ),
}
