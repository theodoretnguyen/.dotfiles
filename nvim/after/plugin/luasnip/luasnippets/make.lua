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

-- [[ Makefiles need tab characters, so don't expand tabs in this buffer ]]
vim.bo.expandtab = false

return {

	-- [[ C++ Makefile ]]
	s(
		{ trig = ";mc", snippetType = "autosnippet", dscr = "C++ Makefile" },
		fmt([[
		CC = g++
		CFLAGS = -std=c++11 -g -Wall

		# Source files (.cpp)
		SRCS = {}
		# Object files (.o)
		OBJS = $(SRCS:.cpp=.o)
		# Executable file
		MAIN = output

		default: $(MAIN)

		$(MAIN): $(OBJS)
			$(CC) $(CFLAGS) -o $(MAIN) $(OBJS)

		.cpp.o:
			$(CC) $(CFLAGS) -c $< -o $@

		clean:
			$(RM) *.o $(MAIN)
		]],
			{
				i(1, "sourceFiles"),
			}
		)
	),

	-- [[ Java Makefile ]]
	s(
		{ trig = ";mj", snippetType = "autosnippet", dscr = "Java Makefile" },
		fmt([[
			JC = javac
			JFLAGS = -g
			.SUFFIXES: .java .class

			# Source files (.java)
			SRCS = {}
			# Class files (.class)
			CLASSES = $(SRCS:.java=.class)

			default: classes

			classes: $(CLASSES)

			.java.class:
				$(JC) $(JFLAGS) $<

			clean:
				$(RM) *.class
		]],
			{
				i(1, "sourceFiles"),
			}
		)
	),
}
