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

-- [[ LaTeX-specific Conditional Expansion Functions ]]
local tex = {}
tex.in_mathzone = function() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- [[ Snippets ]]
return {

  -- Package
  s({ trig = "pack", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \usepackage{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),

  -- Label
  s({ trig = "lbl", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \label{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- URL
  s({ trig = "url", regTrig = false, wordTrig = true },
    fmta([[
    \url{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Vertical Space
  s({ trig= "vs", regTrig = false, wordTrig = true },
    fmta([[
    \vspace{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    {}
  ),

  -- Section
  s({ trig = "h1", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \section{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  s({ trig = "hh1", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \section*{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),

  -- Subsection
  s({ trig = "h2", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \subsection{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  s({ trig = "hh2", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \subsection*{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),

    -- Subsubsection
  s({ trig = "h3", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \subsubsection{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  s({ trig = "hh3", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
    fmta([[
    \subsubsection*{<>}
    ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),
}
