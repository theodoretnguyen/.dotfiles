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

  -- Sunday School Lesson Plan
  s({ trig = "sslp", regTrig = false, wordTrig = true, snippetType = "autosnippet" },
  fmta([[
\documentclass[11pt]{article}
\usepackage[margin = 1.0in]{geometry}
\usepackage{amsmath, amssymb, amsthm}
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage{enumerate}
\usepackage{framed}
\usepackage{changepage}
\usepackage{parskip}
\usepackage{setspace}
\usepackage{tikz}
\usepackage{fancyhdr}
\hypersetup{linktoc = all, urlcolor = cyan, colorlinks = true, linkcolor = black, urlcolor = cyan}

\renewcommand{\familydefault}{\sfdefault}

\title{<>}
\author{Theodore Nguyen}
\date{<>}

\pagestyle{fancy}
\fancyhf{}
\lhead{<>}
\rhead{Page \thepage}

\begin{document}
\maketitle
\tableofcontents

% Passage
\section*{Passage (<>)}
\addcontentsline{toc}{section}{Passage}

<>

\pagebreak

% Observations
\section*{Observations}
\addcontentsline{toc}{section}{Observations}

% Who?
\subsection*{Who?}
\addcontentsline{toc}{subsection}{Who?}
\begin{itemize}
    \item <>
\end{itemize}

% What?
\subsection*{What?}
\addcontentsline{toc}{subsection}{What?}
\begin{itemize}
    \item
\end{itemize}

% When?
\subsection*{When?}
\addcontentsline{toc}{subsection}{When?}
\begin{itemize}
    \item
\end{itemize}

% Where?
\subsection*{Where?}
\addcontentsline{toc}{subsection}{Where?}
\begin{itemize}
    \item
\end{itemize}

% How?
\subsection*{How?}
\addcontentsline{toc}{subsection}{How?}
\begin{itemize}
    \item
\end{itemize}

\pagebreak

% Interpretation
\section*{Interpretation}
\addcontentsline{toc}{section}{Interpretation}

\begin{itemize}
    \item
\end{itemize}

\pagebreak

\subsection*{Notes from Commentary}
\begin{itemize}
    \item
\end{itemize}

\pagebreak

% Application
\section*{Application}
\addcontentsline{toc}{section}{Application}

\begin{enumerate}
    \item
\end{enumerate}

\pagebreak

% Lesson Plan
\section*{Lesson Plan}
\addcontentsline{toc}{section}{Lesson Plan}

\begin{itemize}
    \item
\end{itemize}

\pagebreak

% Passage for Printout
\thispagestyle{empty}
\begin{doublespace}

\huge{\textbf{<>} <>}

{\Large
<>
}
\end{doublespace}

\pagebreak

\thispagestyle{empty}
{\huge Application}
{\LARGE
\begin{itemize}
    \item
\end{itemize}
}

\end{document}
  ]],
      {
        i(1, "PASSAGE OF STUDY"),
        i(2, "DATE"),
        rep(1),
        i(3, "VERSION/TRANSLATION"),
        i(4, "PASSAGE"),
        i(0),
        i(5, "PASSAGE TITLE"),
        rep(1),
        rep(4),
      }
    ),
    { condition = line_begin }
  ),
}
