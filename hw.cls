

% TODO: https://tex.stackexchange.com/a/311476
% \newcommand{\textgreek}[1]{\textit{\begingroup\fontencoding{LGR}\selectfont#1\endgroup}}

% hw.cls
% LaTeX2e class file for generic homework assignments, with a variety
% of shortcuts and useful features. Meant to be adaptable to a wide
% variety of uses.

% Prologue
\ProvidesClass{hw}[2015/10/18 Homework]
\NeedsTeXFormat{LaTeX2e}


% Basic encoding/font stuff
\RequirePackage[utf8]{inputenc} % UTF8 support


\RequirePackage{lmodern} % Improved Computer Modern font
\usepackage{alphabeta}
% Useful tools
\RequirePackage{xkeyval} % DeclareOption but with key-value syntax

% NB: for ancient greek must do fmtutil --all -user after making new language dat files

% Include "article.cls"; fontsize option must be processed early
\DeclareOptionX<early>{fontsize}{ \PassOptionsToClass{#1}{article}
  \PassOptionsToClass{#1}{beamer}  }
\XKV@useoption{beamer}
\makeatletter
\XKV@useoption{beamer}
\define@boolkey{early}[early]{beamer}{}
\define@boolkey{early}[early]{chicago}{}
\makeatother
\presetkeys{early}{fontsize=12pt,beamer=false,chicago=false}{}


\ProcessOptionsX<early>
\ifearlybeamer
  \def\@classoptionslist{X}
  \RequirePackage[T1]{fontenc}
  \LoadClass[usepdftitle=false]{beamer}
\else
    \RequirePackage[BCQ,LGR,T3,T1,OT1]{fontenc} % Modern fonts
    \LoadClass[fleqn]{article}  
    \RequirePackage[letterpaper]{geometry} % Page margins
    \RequirePackage[table,svgnames]{xcolor} % Color presets
    \RequirePackage{titling}
    \RequirePackage[tiny, rigidchapters, bf, pagestyles]{titlesec}
\fi


% \RequirePackage[backend=biber,style=mla]{biblatex}
% \ifearlychicago
%       \RequirePackage[backend=biber,notes,hyperref=false,doi=false,eprint=false]{biblatex-chicago}  
% \else
% \fi

\RequirePackage{hw-deps}