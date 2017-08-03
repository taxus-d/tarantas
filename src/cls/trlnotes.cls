%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Класс для всяких конспектов и заметок
%  Определены всякие нужные окружения 
%+ и настроены(вроде) перекрёстные ссылки
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
% plain notes have only sections
% long notes are more like a report, with chapters and paragraphs
\ProvidesClass{trlnotes}[2017/05/27 Long version of notes]

\RequirePackage{trtools}
\RequirePackage{calc} % TODO: numexpr's
% hspace somehow not fixed by calc, fixing it here
\def\@hspace#1{\begingroup\setlength\dimen@{#1}\hskip\dimen@\endgroup}
\RequirePackage{trcophand}
\RequirePackage{trly}

%%% ===========
%%%  Variables
%%% ===========

\def\@baseclass{report}
\listdef\@complyt{timbord,ebook,hardcopy} % compatible layouts

%%% =================
%%% language settings
%%% =================

\RequirePackage{cmap} %% pdf search & copy
\RequirePackage[utf8]{inputenc}
\RequirePackage[OT1, T2A]{fontenc}
\RequirePackage[english,main=russian]{babel}

\DeclFlagOpt{tikz,draft,exam}
\DeclPassOpt{10pt,12pt}

%% Fallback                                  
\DeclareOption*{
    \ClassWarning{notes}{does not know about `\CurrentOption'. 
    Please, clarify your intentions}{}
    \PassOptionsToClass{\CurrentOption}{\@baseclass}
}

\ProcOpts

\LoadCls{\@baseclass}

\RequirePackage[pdftex]{graphicx}
\RequirePackage{xcolor}
\RequirePackage{verbatim}
\RequirePackage{epigraph}

% table stuff
\RequirePackage{tabulary}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{array}

% manage lists
\RequirePackage[shortlabels]{enumitem}

\iftoggle{tikz}{
  \RequirePackage{tikz}
  \usetikzlibrary{calc,babel,arrows}
  \usetikzlibrary{decorations.markings,quotes,angles}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sectioning styles (ToC, numbering,etc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{titlesec}
\RequirePackage{titletoc}

\titleformat{\chapter}%
{\normalfont\LARGE\bfseries}%
{Глава \ \thechapter:}%
{1ex}%
{\normalfont\LARGE\bfseries}{}

\titlespacing{\chapter}%
{1em}%
{4em plus 2ex minus 1ex}%
{1.5em plus 1ex minus 0.5ex}

\RequirePackage{chngcntr} % tools for counters 
%\@definecounter{paragraph}

% still a bit hacky
% \renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\theparagraph}{\S\thinspace\arabic{paragraph}}
\titleformat {\paragraph}[block]%
{\normalfont\bfseries}%
{\theparagraph}%
{2ex}%
{\normalfont\bfseries}{}

\titlespacing{name=\paragraph}%
{1ex}%
{1em plus 1ex minus 0.5ex}%
{0.7em plus 1ex minus 0.5ex}
\titleformat {name=\paragraph,numberless}%
{\normalfont\bfseries}{\S*}{2ex}{\normalfont\bfseries}{}

\iftoggle{exam}{
  \counterwithout*{paragraph}{chapter}
  \counterwithout*{paragraph}{section}
  \counterwithout*{paragraph}{subsection}
  \counterwithout*{paragraph}{subsubsection}
  \renewcommand{\theparagraph}{№\thinspace\arabic{paragraph}}
  \titleformat\paragraph[block]{\normalfont\bfseries}%
  {Билет\ \theparagraph:}{1ex}{\normalfont\bfseries}{}
}{}

\RequirePackage{tocloft}
\cftsetindents{paragraph}{3.0em}{\widthof{\theparagraph--\arabic{paragraph}}+1em}


\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}


\RequirePackage{perpage}
\MakePerPage{footnote}

% nice hyperlinks
\RequirePackage{hyperref}
% fixes bookmark level
\RequirePackage{bookmark}
\hypersetup{%
  pdfencoding=auto,
  unicode=true,
  colorlinks=true,
  linkcolor=blue, 
  citecolor=green!50!black
  %linkbordercolor=blue,
  %pdfborderstyle={/S/U/W 1}% border style will be underline of width 1pt
}

\reversemarginpar
%for margin notes
% due to their nature, notes are usually placed in free space. And free space
%+ heavily depends on page orientation. Hence:
% : see layout files for \note


\endinput
% vim: nofoldenable
