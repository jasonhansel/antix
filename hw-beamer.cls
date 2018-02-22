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
\presetkeys{early}{fontsize=12pt,beamer=true}{}

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

% % \RequirePackage{etex}

% % Basic encoding/font stuff
% \RequirePackage[utf8]{inputenc} % UTF8 support
% \RequirePackage[LGR,T1]{fontenc} % Modern fonts
% \RequirePackage{lmodern} % Improved Computer Modern font
% % \usepackage{unicode-math}
% % \usepackage{textgreek}
% \usepackage{alphabeta}

% % Prevent clash with timesnewroman
% \RequirePackage[full]{textcomp}

% % Useful tools
% \RequirePackage{xkeyval} % DeclareOption but with key-value syntax

% % Include "article.cls"; fontsize option must be processed early
% \RequirePackage{drac} % Easy 'active' characters


% \DeclareOptionX<early>{fontsize}{
%   \PassOptionsToClass{#1}{article}
%   \PassOptionsToClass{#1}{beamer}
% }
% \XKV@useoption{beamer}
% \makeatletter
% \XKV@useoption{beamer}
% \define@boolkey{early}[early]{beamer}[true]{}
% \makeatother
% \presetkeys{early}{fontsize=12pt,beamer=true}{}

% \DeclareOption{beamer}

% \ProcessOptionsX<early>
% \makeatletter
% \ifearlybeamer
%   \def\@classoptionslist{X}
%   \LoadClass[usepdftitle=false]{beamer}
% \else
%   \LoadClass[fleqn]{article}  
%   \RequirePackage[letterpaper]{geometry} % Page margins
%   \RequirePackage[table,svgnames]{xcolor} % Color presets
%   \RequirePackage{titling}
%   \RequirePackage[tiny, rigidchapters, bf, pagestyles]{titlesec}
%   \RequirePackage[backend=biber,style=mla,hyperref=false,showmedium=false,doi=false]{biblatex}
% \fi
% \makeatother




% \RequirePackage{xstring} % String manipulation
% \RequirePackage[nomessages]{fp} % Arithmetic
% \RequirePackage{etoolbox} % Easier use of e-TeX extensions

% \RequirePackage{xspace} % Macros that preserve spacing


% % Math, symbols, etc.
% \RequirePackage{amssymb} % Useful symbols
% \RequirePackage[fleqn]{mathtools} % General math, including amsmath
% \RequirePackage{cancel} % Cancellation
% \RequirePackage{commath} % Math helpers
% \RequirePackage{bm} % Bold math
% \RequirePackage{nicefrac} % Annotate values with units
% \RequirePackage[mathscr]{eucal} % Use \mathscr for fancy script text
% \RequirePackage{sansmath}
% \RequirePackage{scalerel}


% % Typography
% \RequirePackage{lineno}
% \RequirePackage[english]{babel} % Multilingual tools
% \RequirePackage[autostyle, english=american]{csquotes} % Quotations
% \makeatletter
% %Remove \do\' from the list of reserved chars
% \def\csq@resrvdchars{\do\9}
% \makeatother
% \RequirePackage{pbox}
% \RequirePackage{ragged2e} % Non-justified text
% \RequirePackage{setspace} % Better line spacing
% \RequirePackage{soul} % Nice underlining
% \RequirePackage[normalem]{ulem}
% \RequirePackage{relsize} % Relative text sizing
% % \RequirePackage[shortlabels]{enumitem} % Advanced lists
% \RequirePackage[parfill]{parskip} % Paragraph indent/skip

% % Page layout
% \RequirePackage{multicol} % Multi-column text
% \RequirePackage{parcolumns} % Parallel columns

% % Boxes and frames
% \RequirePackage{tcolorbox} % Colorful boxes
% \RequirePackage[export]{adjustbox} % Transform text boxes
% \RequirePackage{framed} % Better framed/shaded regions

% % Graphics
% \RequirePackage{tikz} % General diagrams and pictures
% \RequirePackage{pgfpages} % TikZ page manipulation, can break hyperlinks
% \RequirePackage{prooftrees} % Truth trees
% \RequirePackage{forest} % Trees
% \RequirePackage[all]{xy} % Diagrams (*breaks* when breqn enabled)
% \RequirePackage{tikz-cd} % Diagrams (like xy-pic but better)

% % Verbatim mode tools
% \RequirePackage{alltt} % Like "verbatim" but with commands enabled
% \RequirePackage{fancyvrb} % Enhanced "verbatim" modes
% \RequirePackage{upquote} % Normal single/double quotes in 


% % Tables
% \RequirePackage[delarray]{tabu} % Advanced table-related features
% \RequirePackage{multirow} % Easy multi-row cells
% \RequirePackage[thinlines]{easytable} % Misc. table shortcuts
% \RequirePackage{makecell} % Table cell customization

% % Misc
% \RequirePackage{syntax} % https://tex.stackexchange.com/questions/24886/
% \RequirePackage{siunitx}


% % Sans math
% \makeatletter
% \renewcommand{\sfMathSwitch}{\sfsl
%   \make@math@version@font \textfont \fam \tf@size
% }
% \makeatother

% % Plots
% \usepackage{pgfplots}
% \pgfplotsset{compat=1.3}


% % Grammar
% \setlength{\grammarparsep}{20pt plus 1pt minus 1pt} % increase separation between rules
% \setlength{\grammarindent}{6em} % increase separation between LHS/RHS 

% % Bib;liography settings
% \ifearlybeamer
% \else
% \renewcommand{\mkdatezeros}{\mkyearzeros}
% \defbibheading{bibliography}[\refname]{\noindent\b{#1}}
% \fi


% \RequirePackage{antix-settings}





% % Bibliography
% \newcommand{\ci}{\autocite}
% \newcommand{\cna}{\autocite*} % Omit author
% \newcommand{\cnp}{\cite} % Omit parens
% \newcommand{\cnap}{\cite*} % Omit parens and author



% % A box with a horizontal rule at the bottom.
% % Useful for study sheets.
% \newcommand{\ibox}[1]{
% \noindent\begin{minipage}{\linewidth}
%     \vspace{7pt}
%     #1
%     \par
%     \vspace{7pt}
%     \hrule
% \end{minipage}
% }

% % For "asterisk" option
% \def\nostar{\catcode`\*=12}
% \def\restar{\catcode`\*=13}
% \def\noqmark{\catcode`?=12}
% \def\reqmark{\catcode`?=13}
% \newenvironment{fixstar}{\catcode`*=12}{}

% \RequirePackage{shortcuts}
% \RequirePackage{shortcuts-text}
% \RequirePackage{shortcuts-matrix}

% \newcolumntype{L}{>{$}l<{$}} % math-mode version of "l" column type
% \newcolumntype{Q}{>{\displaystyle}l} % math-mode version of "l" column type
% \newcolumntype{R}{>{$}r<{$}} % math-mode version of "l" column type



% % Allow right-aligned cases in math mode
% % http://tex.stackexchange.com/questions/27520/
% \makeatletter
% \newcases{rightalignedcases}{\:}{%
%   \hfil$\m@th\displaystyle{##}$}{$\m@th\displaystyle{##}$\hfil}{\lbrace}{.}
% \makeatother


% % Parse options

% \DeclareOptionX<late>{linesp}[1.2]{\AtEndOfClass{
%     \setstretch{#1}
% }}

% \DeclareOptionX<late>{topaligntikz}{
%   \tikzset{baseline={([yshift={-\ht\strutbox}]current bounding box.north)},outer sep=0pt,inner sep=0pt}
% }

% \newcommand{\vecsp}[2]{
%   \ifthenelse{\equal{#1}{3}}{
%       \vec{#2}
%   }{
%       \ifthenelse{\equal{#1}{4}}{
%           \mathbf{#2}
%       }{
%         \ClassWarning{Invalid vector size}
%       }
%   }
% }


% % Enable by default
% \presetkeys{hw.cls}{linesp}{}



% \DeclareOptionX<late>{shortverb}{\AtEndOfClass{
%     % Requires 'monomath' to be specified
%     % \MakeShortVerb{\|}
%     \DefineShortVerb{\|}
% }}
% \DeclareOptionX<late>{algorithms}{\AtEndOfClass{
%   \usepackage[linesnumbered,commentsnumbered]{algorithm2e}
%   \SetKw{KwLet}{let}
%   \SetKw{KwWhere}{where}
%   \SetKw{KwBreak}{break}
%   \SetKw{Return}{return}
%   \DontPrintSemicolon
%   \let\gets\leftarrow
%   \SetArgSty{textrm}
%   \SetFuncSty{textrm}
%   \SetFuncArgSty{textrm}
%   \SetAlCapSty{textrm}
%   \SetAlgoSkip{}
%   \IncMargin{2em}
%   \SetKwSty{boldcompact}
%   \SetKwProg{Fn}{function}{ is}{end}
%   \newcommand{\commentstyle}{\sffamily\relsize{-0.5}}
%   \SetKwComment{Comment}{\fontfamily{phv}\selectfont\relsize{-0.5}// }{}

%   \SetCommentSty{commentstyle}
%   \SetKwInput{AlgoTitle}{Algorithm}
%   \SetKwInput{AlgoTitleT}{Initialization Code}
%   \SetAlgoInsideSkip{medskip}
% }}

% % Page margins
% \ifearlybeamer
% \else
% \geometry{letterpaper,headheight=0pt,headsep=0in,margin=1in,ignoreheadfoot}
% \DeclareOptionX<late>{margin}{
%     \geometry{margin=#1in}
% }
% \newpagestyle{def}{
%   \sethead{}{}{}
%   \setfoot{}{}{}
% }
% \pagestyle{def}
% \fi





% % Header and footer
% \DeclareOptionX<late>{smallheader}{
%   \geometry{headheight=15pt,headsep=10pt,includehead,includefoot}
%   \newpagestyle{custom}{
%     \sethead{\mythetitle}{}{Jason Hansel}
%     \setfoot{}{}{Page \thepage}
%     \setheadrule{0.5pt}
%     \setfootrule{0.5pt}
%   }
%   \newpagestyle{top}{
%     \sethead{\mythetitle}{}{Jason Hansel}
%     \setfoot{}{}{Page \thepage}
%     \setheadrule{0.5pt}
%     \setfootrule{0.5pt}
%   }
%   \pagestyle{custom}
% }


% \setlength{\parindent}{0em}
% \setlength{\arraycolsep}{2pt}

% \DeclareOptionX<late>{ragged}{
%     \setlength{\RaggedRightParindent}{\parindent}
%     \raggedright % Actually, ragged2e isn't very good
% }

% \DeclareOptionX<late>{parindent}{
%     \setlength{\parindent}{3em}
%     \setlength{\parskip}{0em}
% }

% \DeclareOptionX<late>{nohyphen}{
%     %  May need to set "emergencystretch" to avoid line-break issues.
%   % May be better to use 'pretolerance' instead.
%     \hyphenpenalty=10000
%     \exhyphenpenalty=10000
% }

% \DeclareOptionX<late>{noskip}{
%     \setlength{\parindent}{0em}
%     \setlength{\parskip}{0em}
% }






% \DeclareOptionX<late>{fontface}{\AtEndOfClass{
%     \IfEqCase{#1}{
%         % Avoid always including "newtxtext" since it introduces log-parsing errors
%         {times}{ \RequirePackage{newtxtext}
%     \renewcommand{\bfdefault}{b} % Actually this fixes log issues
%     \renewcommand{\b}{\textbf}
%     \renewcommand{\i}{\textit}
%      }
%         {minion}{ \RequirePackage[onlytext,textlf]{MinionPro} }
%     }
% }}

% \makeatletter
% \newif\if@monomath
% \@monomathfalse
% \DeclareOptionX<late>{monomath}{\@monomathtrue}

% \newif\if@incons
% \@inconsfalse
% \DeclareOptionX<late>{incons}{\@inconstrue}

% \newif\if@nobreqn
% \@nobreqnfalse
% \DeclareOptionX<late>{nobreqn}{\@nobreqntrue}

% \newif\if@forceams
% \@forceamsfalse
% \DeclareOptionX<late>{forceams}{\@forceamstrue}
% \makeatother




% \DeclareOptionX<late>{lowdisplayskip}{\AtEndOfClass{
%     \AtBeginDocument{
%         \setlength{\abovedisplayskip}{2pt}
%         \setlength{\belowdisplayskip}{2pt}
%         \setlength{\abovedisplayshortskip}{2pt}
%         \setlength{\belowdisplayshortskip}{2pt} 
%     }
% }}

% \DeclareOptionX<late>{meddisplayskip}{\AtEndOfClass{
%     \AtBeginDocument{
%         \setlength{\abovedisplayskip}{0.3\baselineskip}
%         \setlength{\belowdisplayskip}{0.3\baselineskip}
%         \setlength{\abovedisplayshortskip}{0.3\baselineskip}
%         \setlength{\belowdisplayshortskip}{0.3\baselineskip}
%         \setlength{\jot}{0.3\baselineskip}
%         \renewcommand*{\arraystretch}{0.9}
%     }
% }}



% \DeclareOptionX<late>{colsep}{\AtEndOfClass{
%   \setlength{\columnseprule}{0.2pt}
% }}


% % [questiomark=mathscr], for instance, turns ?A into \mathscr{A}
% \DeclareOptionX<late>{questionmark}{
%     % 1. Define \questionMarkCommand as \#1
%     \edef\questionMarkCommand{\expandafter\noexpand\csname #1\endcsname}
%     \AtEndOfClass{
%         % 2. Define ? as \questionMarkCommand
%         \begingroup\lccode`\~=`\?
%         \lowercase{\endgroup
%             \def~{\questionMarkCommand}
%         }
%         % 3. Make ? an active character
%         \catcode`?=\active
%     }
% }


% % Like "questionmark" but for asterisks
% \DeclareOptionX<late>{asterisk}{
%     % 1. Define \questionMarkCommand as \#1
%     \edef\asteriskCommand{\expandafter\noexpand\csname #1\endcsname}
%     \AtEndOfClass{
%         % 2. Define * as \asteriskCommand
%         \begingroup\lccode`\~=`\*
%         \lowercase{\endgroup
%             \def~{\asteriskCommand}
%         }
%         % 3. Make ? an active character
%         \catcode`*=\active
%     }
% }


% \DeclareOptionX<late>{micro}{ % For review sheets
%   \setlength{\columnsep}{5pt}
% \setlength{\columnseprule}{0.5pt}
% \setlength{\parskip}{0pt}
% \setlist[itemize]{noitemsep,leftmargin=0.7em,label=\textbullet,labelsep=0.2em}
% \setlist[itemize,2]{noitemsep,leftmargin=0.7em,label=\textbullet,labelsep=0.2em}
% \setlist[enumerate]{noitemsep,leftmargin=1em,labelsep=0.2em}
% \setlist[enumerate,2]{a),leftmargin=1.2em}
% \renewcommand\bfdefault{b}
% \linepenalty=10000
% \hfuzz 100pt
% \emergencystretch 0pt
% }

% \makeatletter
% \DeclareOptionX<late>{pageborder}{
%   % \usepackage{showframe}

% \def\Gm@hruled{}
% \def\Gm@hrule{}
% \def\Gm@vrule{\vrule width 0.5pt height\textheight depth\z@}
% % \def\Gm@hrule{\moveleft.5\columnsep\vbox{\hrule height 0.5pt depth\z@ width\textwidth}}
% \renewcommand*{\Gm@vrules@mpi}{%
% \hb@xt@\textwidth{\hspace{-0.5\columnsep}\Gm@vrule\hskip\textwidth\hspace{4.5pt}\Gm@vrule}}

% \geometry{showframe}
% }
% \makeatother

% \DeclareOption{beamer}

% % \ProcessOptionsX
% \ProcessOptionsX<late>









% \renewcommand\cellalign{tl}
% \ifearlybeamer
% \else
% \setlength{\mathindent}{0pt}
% \AtEndOfClass{ % Configure csquotes; csquotes loaded late
  
%     \MakeOuterQuote{"}
%   % \MakeAutoQuote{`}{'}
%   \tikzset{every picture/.prefix code=\DisableQuotes} % Fix quotes in TikZ
  
% }
% \fi


% \newlength{\msize}
% \setlength{\msize}{30pt}
% \newcommand{\mathitem}[1]{
%     \parbox[t]{\linewidth}{
%         \vspace{\msize}
%         #1
%     }
% }






% % http://tex.stackexchange.com/questions/1273/loading-a-package-conditionally
% \makeatletter
% \if@incons
%   \usepackage[scaled=0.95]{inconsolata}
% \fi

% \if@monomath
%     \renewcommand*{\rmdefault}{\ttdefault}
%     \usepackage[defaultimath]{mathastext}
%     \renewcommand*{\rmdefault}{lmr}
%   \thinmuskip=1mu
%   \medmuskip=1mu
%   \thickmuskip=2mu
% \else
%     % Breqn conflicts with mathastext
%   \if@nobreqn
%   \else
%      \usepackage{breqn}
%    % fix a weird bug with the '+' sign wrapping in breqn - not sure why 
%    % this is ever necessary...
%    % \DeclareFlexSymbol{+}{Bin}{OT1}{2B}
%      % \setkeys{breqn}{compact}
%    % \setlength{\eq@linewidth}{0pt}
% \fi\fi



% % must be after 'breqn'
% \if@forceams
% % force amsmath, and replace '$' and '$$' with LaTeX equivalents.
% % May break tikz.
% \RequirePackage[all,error]{onlyamsmath}
% \setlength{\mathindent}{3em}
% \renewcommand{\dspcomplain}[1]{
% \ifmmode
%     \expandafter\]
% \else
%     \expandafter\[
% \fi
% }  
% \fi


% \makeatother

% % \let\originalleft\left
% % \let\originalright\right
% % \renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
% % \renewcommand{\right}{\aftergroup\egroup\originalright}


% % Redo after breqn
% \renewcommand{\del}[1]{\left(#1\right)}
% \renewcommand{\ne}{\ensuremath{\neq}}






% \endinput