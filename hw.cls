

% TODO: https://tex.stackexchange.com/a/311476
% \newcommand{\textgreek}[1]{\textit{\begingroup\fontencoding{LGR}\selectfont#1\endgroup}}

% hw.cls
% LaTeX2e class file for generic homework assignments, with a variety
% of shortcuts and useful features. Meant to be adaptable to a wide
% variety of uses.

% Prologue
\ProvidesClass{hw-beamer}[2015/10/18 Homework]
\NeedsTeXFormat{LaTeX2e}


% Basic encoding/font stuff
\RequirePackage[utf8]{inputenc} % UTF8 support
\RequirePackage[LGR,T1]{fontenc} % Modern fonts
\RequirePackage{lmodern} % Improved Computer Modern font
\usepackage{alphabeta}
% Useful tools
\RequirePackage{xkeyval} % DeclareOption but with key-value syntax


% Include "article.cls"; fontsize option must be processed early
\DeclareOptionX<early>{fontsize}{ \PassOptionsToClass{#1}{article}
  \PassOptionsToClass{#1}{beamer}  }
\XKV@useoption{beamer}
\makeatletter
\XKV@useoption{beamer}
\define@boolkey{early}[early]{beamer}{}
\makeatother
\presetkeys{early}{fontsize=12pt,beamer=false}{}

\DeclareOption{beamer}

\ProcessOptionsX<early>
\makeatletter
\ifearlybeamer
  \def\@classoptionslist{X}
  \LoadClass[usepdftitle=false]{beamer}
\else
  \LoadClass[fleqn]{article}  
  \RequirePackage[letterpaper]{geometry} % Page margins
  \RequirePackage[table,svgnames]{xcolor} % Color presets
  \RequirePackage{titling}
  \RequirePackage[tiny, rigidchapters, bf, pagestyles]{titlesec}
  \RequirePackage[backend=biber,style=mla,hyperref=false,showmedium=false,doi=false]{biblatex}
\fi
\makeatother

\RequirePackage{hw-deps}