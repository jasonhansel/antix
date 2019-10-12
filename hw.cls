

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



\usepackage[check-declarations]{expl3}


\usepackage{alphabeta}
% Useful tools
\RequirePackage{xkeyval} % DeclareOption but with key-value syntax

\RequirePackage{etoolbox}

% NB: for ancient greek must do fmtutil --all -user after making new language dat files

% Include "article.cls"; fontsize option must be processed early
\newtoggle{twelve}
\newtoggle{earlybeamer}
\newtoggle{earlychicago}
\newtoggle{earlythesis}
\newtoggle{earlygraphics}
\global\togglefalse{twelve}
\global\togglefalse{earlybeamer}
\global\togglefalse{earlychicago}
\global\togglefalse{earlythesis}
\global\toggletrue{earlygraphics}



% \DeclareOptionX<early>{font-size}{
%   \AtBeginDocument{\changefontsizes{#1}}
%  }

\makeatletter
\define@boolkey{early}[early]{beamer}{\global\settoggle{earlybeamer}{#1}}
\define@boolkey{early}[early]{thesis}{\global\settoggle{earlythesis}{#1}}
\define@boolkey{early}[early]{chicago}{\global\settoggle{earlychicago}{#1}}
\define@boolkey{early}[early]{graphics}{\global\settoggle{earlygraphics}{#1}}
% \presetkeys{early}{beamer=false,chicago=false,thesis=false,graphics=true}{}

\ProcessOptionsX<early>

\makeatother



\iftoggle{earlybeamer}{
  \def\@classoptionslist{X}
  \RequirePackage[T1]{fontenc}
  \LoadClass[usepdftitle=false]{beamer}
}{
    \RequirePackage[BCQ,T1]{fontenc} % Modern fonts
    \LoadClass[fleqn,12pt]{article}  
    \RequirePackage[letterpaper]{geometry} % Page margins
    \RequirePackage[table,svgnames]{xcolor} % Color presets
    \RequirePackage{titling}
    \RequirePackage[tiny, bf, pagestyles, compact]{titlesec}
    \RequirePackage{titletoc}
}


\RequirePackage[fontsize=12]{scrextend} % for blockquotes; nb iss with font sizes


\RequirePackage{hw-deps}