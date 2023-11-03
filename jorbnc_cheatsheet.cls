% ======================================================================================================
% ===== GENERAL LOADING AND EXPORTING ==================================================================
% ======================================================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jorbnc_cheatsheet}[Custom LaTeX Class for cheatsheets and course summaries]
\LoadClass[fontsize=8pt,
           twoside=false,
           parskip=half,
           headings=small,
           numbers=withenddot] % Dot after enumeration
           {scrartcl}

% ======================================================================================================
% ===== PACKAGES =======================================================================================
% ======================================================================================================

% ===== COMMANDS =======================================================================================
\RequirePackage{xparse} %  Document-level custom com-mands. Improve optional arguments, stars, mandatory arguments, etc.

% ===== GENERAL LAYOUT =================================================================
\RequirePackage[paper=legalpaper,
                landscape,
                left=6mm, right=6mm, top=6mm, bottom=4mm]
                {geometry} % Simple layout settings: paper size, margins, footnote, header, orientation, etc. 
\RequirePackage{multicol} % Self-explanatory
\RequirePackage{subcaption} % Place figures next to each other


% ===== FONTS & SPECIAL CHARACTERS ====================================================================
\RequirePackage[T1]{fontenc} % Accentend characters (ö), proper copy/paste, math symbols...
\usepackage[scaled=.90]{beramono}
\RequirePackage{upgreek} % \uptau=τ...
\RequirePackage{anyfontsize} % Allows to select any font size via \fontsize{...}{...}\selectfont, even those sizes that are not listed in the .fd file.
\RequirePackage{centernot} % Unlike the default \not command, the symbol is horizontally centered. 
\RequirePackage[english]{babel} % Support for many languages
\RequirePackage{lmodern} % Still needed for some configurations
\RequirePackage{fontspec} % [XeLaTeX, LuaLaTeX] Interface for font selection. Allows to load OpenType fonts. Provides command \setmainfont 
\RequirePackage{microtype} % Font expansion and character protrusion
\RequirePackage[autostyle=true]{csquotes} % Loads the correct quotation characters for \textquote{}, works wth babel
\RequirePackage{pifont} % \ding{} symbol in the itemize environment
\RequirePackage{ragged2e}
\RequirePackage{textcomp} % For the (R) symbol of text registered ---> \textregistered
\RequirePackage{mathpazo}

% ===== COLORS ========================================================================================
\RequirePackage[dvipsnames]{xcolor} % Extra colors https://www.overleaf.com/learn/latex/Using_colours_in_LaTeX


% ===== TABLES & LISTS ================================================================================
\RequirePackage{enumitem} % User control over the environments: enumerate, itemize, description
\RequirePackage{booktabs} % Extra commands for tables


% ===== MATHEMATICS ===================================================================================
\RequirePackage{amsthm} % Enhanced \newtheorem
\RequirePackage{mathtools} % Provides a series of packages to enhance the appearance of mathematics
\RequirePackage{float} % Improves the interface for defining floating objects such as figures and tables.
\RequirePackage{amssymb} % Defines many math symbols like \mathbb{R}, \hat, etc.
\RequirePackage{units} % Nice units and fractions with e.g. \unit[1]{m}, \unitfrac{m}{s}, \nicefrac{m}{s}
\RequirePackage{empheq} % Attractive Boxed Equations
\RequirePackage[thinc]{esdiff} % Shorthand derivatives

% ===== IMAGES =========================================================================================
\RequirePackage{graphicx} % Insert images


% ===== FIGURES ========================================================================================
\RequirePackage{pgfplots} % FOO
  \usetikzlibrary{
    calc, patterns, positioning, arrows.meta, petri, positioning, calligraphy, math, angles, quotes
  }
\RequirePackage{sankey}

% ===== BIBLIOGRAPHY & REFERENCES =======================================================================
\RequirePackage[backend    = biber,
                natbib     = true,
                style      = ext-numeric, % Original was "numeric" only. This one allows to change colors
                sorting    = none]{biblatex}
\addbibresource{books.bib} % Load references
\addbibresource{articles.bib} % Load references
\addbibresource{web.bib} % Load references
\RequirePackage[colorlinks, citecolor=red, filecolor=blue, linkcolor=blue, urlcolor=blue]{hyperref}

% ===== SOURCE CODES ====================================================================================
\RequirePackage{listings}
\lstset{
	backgroundcolor=\color{listinggray},
	basicstyle=\ttfamily\small,
	aboveskip={0.4\baselineskip},
	belowskip={0.4\baselineskip},
	literate={ä}{{\"a}}1 {ö}{{\"o}}1 {ü}{{\"u}}1 {Ä}{{\"A}}1 {Ö}{{\"O}}1 {Ü}{{\"u}}1 {ß}{{\ss}}1 {ô}{{\^o}}1	
}

% ======================================================================================================
% ===== GENERAL SETTINGS ===============================================================================
% ======================================================================================================

% ===== MAIN FONT ======================================================================================
\setmainfont{Revx Neue Demo}
% Fixes how \implies behaves with the Revx Neue Demo font
\makeatletter
    % Load the OT1 definitions for lmodern
    \input{ot1lmr.fd}
    % Change the definition for \OT1/lmr/m/n/<size>
    \DeclareFontShape{OT1}{lmr}{m}{n}%
    {<-5.5>    rm-lmr5  <5.5-6.5> rm-lmr6
    <6.5-7.5> rm-lmr7  <7.5-8.5> rm-lmr8
    <8.5-9.5> rm-lmr9  <9.5->    rm-lmr10
    }{}
\makeatother

%\setmathrm{Calibri}

% \pagestyle{empty}
% \abovedisplayskip=1pt\belowdisplayskip=0pt\abovedisplayshortskip=0pt\belowdisplayshortskip=0pt

% ===== SECTION FORMATTING =================================================================
\RedeclareSectionCommand[
  afterskip=-1em,
  runin=true,
  beforeskip=\baselineskip
]{subsubsection} % Avoid line breaks after subsubsection declaration

\providecommand{\sectionbox}[1]{
	\fboxsep0.5em\hspace{-2.0\fboxsep}
	\fcolorbox{BrickRed}{BrickRed}{\parbox{\columnwidth}{\raggedright \section{#1}}}
}

\providecommand{\subsubsectionbox}[3]{\fboxsep0.5em\hspace*{-1.5\fboxsep}%
  \fcolorbox{gray}{gray!3}{%
  \parbox{\columnwidth}{%
  \raggedright {\subsubsection{#1}\hfill\supercite{#2}} \topline #3}}}

\providecommand{\subsubsectionboxEDIT}[3]{\fboxsep0.5em\hspace*{-1.5\fboxsep}%
  \fcolorbox{gray}{yellow!50}{%
  \parbox{\columnwidth}{%
  \raggedright {\subsubsection{#1}\hfill\supercite{#2}} \topline #3}}}
 
\NewDocumentCommand{\examplebox}{o m}{
  \IfNoValueTF{#1}
    {
      \fboxsep0.5em\hspace*{-1.5\fboxsep}%
      \fcolorbox{gray}{Goldenrod!15!white!}{%
      \parbox{\columnwidth}{%
      \raggedright #2}}%
    }%
    {
      \fboxsep0.5em\hspace*{-1.5\fboxsep}%
      \fcolorbox{gray}{Goldenrod!15!white!}{%
      \parbox{\columnwidth}{%
      \raggedright \subsubsection{#1}\hfill \topline #2}}%
    }%
}

\setkomafont{section}{\LARGE\bfseries\color{White}} % Font size and Color
\setkomafont{subsection}{\large\bfseries\color{blue}}
\setkomafont{subsubsection}{\footnotesize\normalfont\bfseries\color{BrickRed}}

\setcounter{secnumdepth}{3} % No enumeration
\RedeclareSectionCommand[beforeskip=1pt, afterskip=5sp]{section} % Spacing and dimensions inside the box
\RedeclareSectionCommand[beforeskip=-2pt, afterskip=3sp]{subsection}
\RedeclareSectionCommand[beforeskip=-1pt, afterskip=3sp]{subsubsection}

% ===== LINES, PARAGRAPH & TABLES SPACING ========================================================
\setlength{\parskip}{2pt}
\renewcommand{\arraystretch}{1.5} % Tabular environments are properly displayed (haven't figured out why it doesn't work with 1)
\renewcommand{\baselinestretch}{1}
\setlength{\tabcolsep}{3pt}
\sloppy
\setlength{\intextsep}{5pt plus 2pt minus 2pt}

% ===== PATH, FOLDERS & VERBATIM ========================================================
\graphicspath{{img/}}

% \RequirePackage{cprotect}
% \def\AAAfoldernamecprotect{cpt_files} % Name of the folder in which .cpt files are stored
% \makeatletter % This block is necessary implements the new destination of .cpt files
%   \def\CPT@read@mbeg{%
%   \stepcounter{CPT@WriteCount}%
%   \edef\CPT@filename{./\AAAfoldernamecprotect/\jobname-\arabic{CPT@WriteCount}.cpt}%
%   \expandafter\expandafter\expandafter\CPT@commandatend@toks
%   \expandafter\expandafter\expandafter{%
%     \expandafter\the
%     \expandafter\CPT@commandatend@toks
%     % Input a file:
%     \expandafter{%
%       \expandafter\protect
%       \expandafter\input
%       \CPT@filename
%       \relax
%     }%
%   }%
%   %\showthe\CPT@commandatend@toks%
%   \begingroup%
%   \makeallother%
%   \def\CPT@preText{}%
%   \let\CPT@postText\CPT@hat@hat@E@hat@hat@L%
%   \let\CPT@begin\CPT@other@bgroup%
%   \let\CPT@end\CPT@other@egroup%
%   \CPT@readContent%
% }%
% \makeatother
% \let\oldsectionbox\sectionbox
% \outer\def\sectionbox{\icprotect\oldsectionbox}


% ===== COLOR DEFINITIONS ========================================================
\definecolor{darkblue}{RGB}{0, 82, 147}
\definecolor{annot_color}{RGB}{52, 135, 10} % Kind of dark green
\definecolor{citecolor}{RGB}{0, 102, 0}
\appto{\citesetup}{\fontsize{4}{8}\sffamily}
% The following works with the "ext-numeric" citestyle
%\DeclareOuterCiteDelims{cite}{\textcolor{annot_color}{\bibopenbracket}}{\textcolor{annot_color}{\bibclosebracket}}


% ===== LINKS SETTINGS ========================================================
\hypersetup{
	pdfcreator={LaTeX2e},
	pdfborder=0 0 0,
	breaklinks=true,
	bookmarksopen=true,
	bookmarksnumbered=true,
	linkcolor=blue,
	urlcolor=blue,
	citecolor=citecolor,
	colorlinks=blue,
	pdfauthor=Jorbnc, 
	pdftitle=LaTeX Cheatsheet,
	pdfcreator=LaTeX2e 
}
\urlstyle{sf}

% ===== PGFPLOTS/TIKZ SETTINGS ========================================================
\tikzset{>=stealth}
\pgfplotsset{hide scale/.style={ /pgfplots/xtick scale label code/.code={}, 
								 /pgfplots/ytick scale label code/.code={}}
}
\tikzset{pics/bar/.style 2 args={code={ \fill (-.1,0) rectangle (.1,#1) (0,#1) node[above,scale=1/2]{$#2$}; }}}
\pgfplotsset{
    compat=1.17,
    samples=200,
    clip=false,
    1Quad/.style={
        axis x line=middle,
        axis y line=middle,
        legend pos=outer north east,
        axis line style={->},
        legend style={font=\tiny},
        label style={font=\tiny},
        tick label style={font=\tiny},
        xlabel style={at={(ticklabel* cs:1)},anchor=west,font=\tiny,},
        ylabel style={at={(ticklabel* cs:1)},anchor=west,font=\tiny,},
        %xlabel=$X$,
        %ylabel=$Y$
        },
    4Quad/.style={
        axis x line=middle,
        axis y line=middle,
        legend pos=outer north east,
        axis line style={->},
        legend style={font=\tiny},
        label style={font=\tiny},
        tick label style={font=\tiny},
        xlabel style={at={(ticklabel* cs:1)},anchor=west,font=\tiny,},
        ylabel style={at={(ticklabel* cs:1)},anchor=west,font=\tiny,}
        },
}


% ===== LISTS & ITEMS =================================================================
\setlist{noitemsep,itemindent=0pt,leftmargin=1.8em,nosep}
\setlist[itemize]{label*=\ding{223}}

% ======================================================================================================
% ===== NEW COMMANDS ===================================================================================
% ======================================================================================================
\newcommand{\topline}{\vspace{2pt}{\color{Gray!80}\hrule}\vspace{3pt}}
\renewcommand{\qedsymbol}{$\!\! \blacksquare$}
\newcommand{\bcentering}[1]{\par\vspace{1.5mm}{\centering \boxed{#1}\par}\vspace{1.5mm}}
\newcommand{\centerexpr}[1]{\par\vspace{1.25mm}{\centering #1\par}\vspace{1.25mm}}
\newcommand{\then}{\textcolor{blue}{\enspace\Rightarrow\enspace}}
\newcommand{\AND}{\textcolor{blue!70!black}{\;\,\land\;\,}}
\newcommand{\OR}{\textcolor{blue!70!black}{\;\,\lor\;\,}}
\newcommand{\ldraw}{black}
\newcommand{\breakspace}{\par\vspace{1.5mm}}
\newcommand{\dollars}{\$\hspace{0.20mm}}

% Colors for text
\newcommand{\Blue}[1]{\textcolor{blue}{#1}}
\newcommand{\BlueA}[1]{\textcolor{NavyBlue}{#1}}
\newcommand{\Red}[1]{\textcolor{red}{#1}}
\newcommand{\Green}[1]{\textcolor{green!70!black}{#1}}

% Flow color
\definecolor{MoneyFlow}{RGB}{0,179,0} % RGB(0, 255*70% + 0*30%, 0) or equivalent to green!70!black
\definecolor{InfoFlow}{RGB}{0,110,184} % NavyBlue in RGB
\definecolor{MaterialFlow}{HTML}{00ff34}

% Other colors
\definecolor{RedFigA}{HTML}{ff3246}
\definecolor{GreenFigA}{HTML}{00ff34}


