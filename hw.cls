% hw.cls
% LaTeX2e class file for generic homework assignments, with a variety
% of shortcuts and useful features. Meant to be adaptable to a wide
% variety of uses.

% Prologue
\ProvidesClass{hw}[2015/10/18 Homework]
\NeedsTeXFormat{LaTeX2e}

% Basic encoding/font stuff
\RequirePackage{lmodern} % Improved Computer Modern font
\RequirePackage[utf8]{inputenc} % UTF8 support
\RequirePackage[T1]{fontenc} % Modern fonts

% Useful tools
\RequirePackage{xkeyval} % DeclareOption but with key-value syntax
\RequirePackage{xstring} % String manipulation
\RequirePackage[nomessages]{fp} % Arithmetic
\RequirePackage{etoolbox} % Easier use of e-TeX extensions
\RequirePackage[table,svgnames]{xcolor} % Color presets
\RequirePackage{l3regex} % Regular expressions

% Math, symbols, etc.
\RequirePackage{amssymb} % Useful symbols
\RequirePackage[fleqn]{mathtools} % General math, including amsmath
\RequirePackage{cancel} % Cancellation
\RequirePackage[nice]{nicefrac} % Slashed fractions
\RequirePackage{commath} % Math helpers
\RequirePackage{bm} % Bold math
\RequirePackage{units} % Annotate values with units
\usepackage[mathscr]{eucal} % Use \mathscr for fancy script text

% Typography
\RequirePackage[english]{babel}
\RequirePackage{ragged2e} % Non-justified text
\RequirePackage{setspace}
\RequirePackage{soul}

% Page layout
\RequirePackage[letterpaper]{geometry} % Page margins
\RequirePackage{fancyhdr} % Fancy headers and footers
\RequirePackage{multicol} % Multi-column text
\RequirePackage{parcolumns} % Parallel columns

% Boxes and frames
\RequirePackage{tcolorbox}
\RequirePackage{adjustbox}
\RequirePackage{framed}

% Graphics
\RequirePackage{tikz} % General diagrams and pictures
% \RequirePackage{fitch}
\RequirePackage{pgf}
\RequirePackage{pgfpages}
\RequirePackage{prooftrees} % Truth trees
\RequirePackage{forest} % Trees



% Verbatim mode tools
% \RequirePackage{moreverb}
% \RequirePackage{shortvrb}
\RequirePackage{alltt} % Like "verbatim" but with commands enabled
\RequirePackage{fancyvrb}
\RequirePackage{upquote}


% Tables
\RequirePackage{tabu} % Note: http://tex.stackexchange.com/questions/87144/ on verbatim and tabu
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage[thinlines]{easytable}
\RequirePackage{makecell}




\RequirePackage{xspace}

\xspaceaddexceptions{"}




% Ignore some amsmath warnings
\makeatletter
\let\over\@@over
\let\atopwithdelims\@@atopwithdelims
\makeatother

% Settings
\delimiterfactor=800
\delimitershortfall=3pt


% TikZ
\usetikzlibrary{positioning, matrix, arrows.meta, backgrounds, shapes.multipart,chains, calc}
\tikzset{dot/.style={circle, fill=black}}
\tikzset{cell/.style={minimum size=0.5cm, draw=black, line width=1pt,
 text height=0.25cm,text width=0.25cm,text centered}}{}

% Math commands
\renewcommand{\exp}[1]{\ensuremath{e^{#1}}}
\renewcommand{\P}[1]{\mathrm{P}(\kern-0.5pt#1)}


% A box with a horizontal rule at the bottom.
% Useful for study sheets.
\newcommand{\ibox}[1]{
\noindent\begin{minipage}{\linewidth}
	\vspace{7pt}
	#1
	\par
	\vspace{7pt}
	\hrule
\end{minipage}
}

% For "asterisk" option
\def\nostar{\catcode`\*=12}
\def\restar{\catcode`\*=13}
\newenvironment{fixstar}{\catcode`*=12}{}


\usepackage{shortcuts}

\usepackage{shortcuts-text}

\newcommand{\eof}{\end{document}}

\newcommand{\br}{\\[\baselineskip]}

% Environments

\newcolumntype{L}{>{$}l<{$}} % math-mode version of "l" column type
\newcolumntype{R}{>{$}r<{$}} % math-mode version of "l" column type

\usepackage{shortcuts-matrix}


% Allow right-aligned cases in math mode
% http://tex.stackexchange.com/questions/27520/
\makeatletter
\newcases{rightalignedcases}{\:}{%
  \hfil$\m@th\displaystyle{##}$}{$\m@th\displaystyle{##}$\hfil}{\lbrace}{.}
\makeatother


% Parse options

\DeclareOptionX{linespacing}[1.2]{\AtEndOfClass{
	\setstretch{#1}
}}

\ExecuteOptionsX{linespacing} % In case option is not included



\DeclareOptionX{shortverb}{\AtEndOfClass{
	% Requires 'monomath' to be specified
	% \MakeShortVerb{\|}
	\DefineShortVerb{\|}
}}
\DeclareOptionX{algorithms}{\AtEndOfClass{
  \usepackage[linesnumbered]{algorithm2e}
  \SetKw{KwLet}{let}
  \SetKw{KwWhere}{where}
  \SetKw{KwBreak}{break}
  \DontPrintSemicolon
  \let\gets\leftarrow
  \SetArgSty{textrm}
  \SetAlgoSkip{}
  \IncMargin{2em}
  \SetKwSty{boldcompact}
  \SetKwProg{Fn}{function}{ is}{end}
}}

% Page margins, header, footer
% Page margins
\AtEndOfClass{
	\geometry{letterpaper,headheight=15pt,headsep=0in,margin=1in,includehead,includefoot}
 	\resetheader
}
\DeclareOptionX{smallmargins}{\AtEndOfClass{
  \geometry{headheight=12pt,headsep=0in,margin=0.5in,includehead,includefoot}
  \resetheader
}}
\DeclareOptionX{tinymargins}{\AtEndOfClass{
  \geometry{headheight=12pt,headsep=0in,margin=0.3in,includehead,includefoot}
  \resetheader
}}
\makeatletter
\newcommand{\resetheader}{
  % Reset after geometry change
  \fancy@setoffs
}
 \makeatother
\AtEndOfClass{
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[L]{Jason Hansel}
  \fancyhead[R]{Page \thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\DeclareOptionX{nohead}{\AtEndOfClass{
	\fancyhf{}
}}



\DeclareOptionX{parindent}{\AtEndOfClass{
	\setlength{\parindent}{3em}
	\setlength{\parskip}{0em}
}}
\DeclareOptionX{ragged}{\AtEndOfClass{
	\setlength{\RaggedRightParindent}{\parindent}
	\RaggedRight
}}
\DeclareOptionX{nohyphen}{\AtEndOfClass{
  % \tolerance 99999
  % \emergencystretch=\maxdimen
  \hyphenpenalty=10000
	\exhyphenpenalty=10000
}}
\DeclareOptionX{noskip}{\AtEndOfClass{
  \setlength{\parindent}{0em}
	\setlength{\parskip}{0em}
}}





\DeclareOptionX{fontface}{\AtEndOfClass{
	\IfEqCase{#1}{
		% Avoid always including "newtxtext" since it introduces log-parsing errors
		{times}{ \RequirePackage{newtxtext} }
		{minion}{ \RequirePackage[onlytext,textlf]{MinionPro} }
	}
}}

\makeatletter
\newif\if@monomath
\@monomathfalse
\DeclareOptionX{monomath}{\@monomathtrue}

\newif\if@incons
\@inconsfalse
\DeclareOptionX{incons}{\@inconstrue}

\newif\if@nobreqn
\@nobreqnfalse
\DeclareOptionX{nobreqn}{\@nobreqntrue}
\makeatother



\DeclareOptionX{lowdisplayskip}{\AtEndOfClass{
    \AtBeginDocument{
        \setlength{\abovedisplayskip}{2pt}
        \setlength{\belowdisplayskip}{2pt}
        \setlength{\abovedisplayshortskip}{2pt}
        \setlength{\belowdisplayshortskip}{2pt} 
    }
}}

\DeclareOptionX{meddisplayskip}{\AtEndOfClass{
    \AtBeginDocument{
        \setlength{\abovedisplayskip}{0.3\baselineskip}
        \setlength{\belowdisplayskip}{0.3\baselineskip}
        \setlength{\abovedisplayshortskip}{0.3\baselineskip}
        \setlength{\belowdisplayshortskip}{0.3\baselineskip}
        \setlength{\jot}{0.3\baselineskip}
        \renewcommand*{\arraystretch}{0.9}
    }
}}

\DeclareOptionX{colsep}{\AtEndOfClass{
  \setlength{\columnseprule}{0.2pt}
}}


% [questiomark=mathscr], for instance, turns ?A into \mathscr{A}
\DeclareOptionX{questionmark}{
    % 1. Define \questionMarkCommand as \#1
    \edef\questionMarkCommand{\expandafter\noexpand\csname #1\endcsname}
    \AtEndOfClass{
    	% 2. Define ? as \questionMarkCommand
		\begingroup\lccode`\~=`\?
		\lowercase{\endgroup
			\def~{\questionMarkCommand}
		}
		% 3. Make ? an active character
		\catcode`?=\active
	}
}

% Like "questionmark" but for asterisks
\DeclareOptionX{asterisk}{
    % 1. Define \questionMarkCommand as \#1
    \edef\asteriskCommand{\expandafter\noexpand\csname #1\endcsname}
    \AtEndOfClass{
    	% 2. Define * as \asteriskCommand
		\begingroup\lccode`\~=`\*
		\lowercase{\endgroup
			\def~{\asteriskCommand}
		}
		% 3. Make ? an active character
		\catcode`*=\active
	}
}

\DeclareOptionX{fontsize}{
	\PassOptionsToClass{#1}{article}
}

% Set default options
\presetkeys{hw.cls}{fontsize=12pt}{}

\ProcessOptionsX



\LoadClass[fleqn]{article}

\usepackage[parfill]{parskip}


% Headings
\usepackage[tiny, rigidchapters, bf, explicit]{titlesec}
\titleformat{\part}[hang]{}{}{0pt}{\textbf{#1}}
\titlelabel{}
\titlespacing{\part}{0pt}{0pt}{0pt}
\titlespacing{\chapter}{0pt}{0pt}{0pt}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}

% Fix chapters
\titleclass{\chapter}{straight}[\part]
\newcounter{chapter}
\renewcommand{\thechapter}{}
\renewcommand{\chaptertitlename}{}
\titleformat{\chapter}[hang]{}{}{0pt}{\textbf{#1}}[]


\setlength{\parindent}{0em}
\renewcommand\cellalign{tl}
\setul{.6ex}{.1ex}
\setlength{\mathindent}{0pt}
\usepackage[autostyle, english=american]{csquotes}
\MakeOuterQuote{"}

\usepackage[shortlabels]{enumitem}
\setlist{topsep=0pt,parsep=2ex,itemsep=0pt}
\setlist[itemize]{label=$\bullet$}
\newlength{\msize}
\setlength{\msize}{30pt}
\newcommand{\mathitem}[1]{
    \parbox[t]{\linewidth}{
        \vspace{\msize}
        #1
    }
}


\usepackage{relsize}





% http://tex.stackexchange.com/questions/1273/loading-a-package-conditionally
\makeatletter
\if@incons
  \usepackage[scaled=0.95]{inconsolata}
\fi

\if@monomath
	\renewcommand*{\rmdefault}{\ttdefault}
	\usepackage[defaultimath]{mathastext}
	\renewcommand*{\rmdefault}{lmr}
  \thinmuskip=1mu
  \medmuskip=1mu
  \thickmuskip=2mu
\else
	% Breqn conflicts with mathastext
  \if@nobreqn
  \else
	 \usepackage{breqn}
	 \setkeys{breqn}{compact}

  \fi
\fi



\makeatother








\endinput
