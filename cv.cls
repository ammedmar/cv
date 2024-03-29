\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{a4paper}
\ProcessOptions\relax
\LoadClass[10pt, onecolumn, oneside]{memoir}

\setlrmarginsandblock{2cm}{2cm}{*}
\setulmarginsandblock{1.5cm}{1.5cm}{*}
\checkandfixthelayout

\RequirePackage{marvosym}
\RequirePackage{graphicx}
\RequirePackage[x11names]{xcolor}
\RequirePackage[T1]{fontenc}
\usepackage{gentium}

\pagestyle{empty}
\addtolength{\parskip}{6pt}

% bibliography
\usepackage[sorting=none,
			backend=biber,
			backref=true,
			url=false,
			doi=false,
			isbn=false,
			eprint=false
			]{biblatex}

\setlength\bibitemsep{0.5\itemsep}
\renewbibmacro{in:}{}  % don't display "in:" before the journal name
\AtEveryBibitem{\clearfield{pages}}  % don't show page numbers
\DeclareFieldFormat{labelnumberwidth}{#1\adddot}  % numbering bib entries 1. etc


%%% titles with hyperreferences in biblioglraphy
\DeclareFieldFormat{title}{\myhref{\mkbibemph{#1}}}
\DeclareFieldFormat
[article,inbook,incollection,inproceedings,patent,thesis,unpublished]
{title}{\myhref{#1\isdot}}

\newcommand{\doiorurl}{%
	\iffieldundef{url}
	{\iffieldundef{eprint}
		{}
		{http://arxiv.org/abs/\strfield{eprint}}}
	{\strfield{url}}%
}

\newcommand{\myhref}[1]{%
	\ifboolexpr{%
		test {\ifhyperref}
		and
		not test {\iftoggle{bbx:eprint}}
		and
		not test {\iftoggle{bbx:url}}
	}
	{\href{\doiorurl}{#1}}
	{#1}%
}

%%% Colors
\def\myColor{DeepSkyBlue4}
\def\linkColor{DodgerBlue3}

%%% Links
\usepackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor  = DodgerBlue4,
	citecolor  = DodgerBlue4,
	urlcolor   = DodgerBlue4,
}

%%% Header
\newcommand{\Header}[3]{
	\noindent
	\textcolor{\myColor}{\Huge{#1}}\\
	\smallskip
	\Letter\ \href{mailto:#2}{#2}\
	\quad \textcolor{\myColor}{|} \quad
	\Mundus\ \href{#3}{#3}
}
%%% Heading
\newcommand{\newHeading}[1]{
	\par
	\smallskip
	\noindent
	\textcolor{\myColor}{\Large{#1}}
	\smallskip
	\hrule
}
%%% SubHeading
\newcommand{\newSubHeading}[1]{
	\noindent
	\textcolor{\myColor}{\begin{itshape}\large{#1:}\end{itshape}}\\
}
%%% Professional experience
\newcommand{\newRole}[3]{
	\begin{samepage}
		\noindent
		\large{#1} \hfill {#3} \\
		\normalsize{#2} \par
	\end{samepage}
}
%%% Education
\newcommand{\newUniv}[5]{
	\begin{samepage}
		\noindent
		\large{#1} \hfill {#5} \\
		\normalsize{#2} \\
		\small{Thesis: \begin{itshape}#3\end{itshape}} \\
		\small{Advisor: #4} \par
	\end{samepage}
}
%%% Expertise
\newcommand{\newExpe}[2]{
	\begin{samepage}
		\noindent
		\large{#1}: \\
		\normalsize{#2}. \par
	\end{samepage}
}
%%% Editorial
\newcommand{\newEdit}[2]{
	\begin{samepage}
		\noindent {#1}, \begin{itshape}#2\end{itshape} \\
	\end{samepage}
}
%%% Teaching
\newcommand{\newTeach}[2]{
	\begin{samepage}
		\noindent {#1} \hfill {#2} \\
	\end{samepage}
}
%%% Software
\newcommand{\newSoftEntry}[2]{
	\begin{samepage}
		\noindent {#1} \hfill \href{#2}{\Mundus}\\
	\end{samepage}
}
%%% Talks
\newcommand{\newTalk}[3]{
	\begin{samepage}
		\noindent {#2}. \hfill {#3} \\
	\end{samepage}
}
%%% References
\newcommand{\newReference}[2]{
	\begin{samepage}
		\noindent {#1}, \begin{itshape}#2\end{itshape} \\
	\end{samepage}
}