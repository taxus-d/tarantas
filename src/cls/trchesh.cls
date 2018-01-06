%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Класс для всяких конспектов и заметок
%  Определены всякие нужные окружения 
%+ и настроены(вроде) перекрёстные ссылки
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
% plain notes have only sections
% long notes are more like a report, with chapters and paragraphs
\ProvidesClass{trchesh}[2017/05/27 Short version of notes]


\RequirePackage{trcore}
\RequirePackage{trly}
\RequirePackage{trclstools}

%%% =================
%%% language packages
%%% =================

\RequirePackagePack{trulang}

%%% ===========
%%%  Variables
%%% ===========

\def\@baseclass{article}
\listdef\@complyt{timbord,ebook,hardcopy} % compatible layouts

%%% =======================
%%% Option processing stuff
%%% =======================

\DeclFlagOpt{tikz,exam}
\DeclCompOpt{final<>draft}
\DeclPassOpt{10pt,12pt}

%% Fallback
\DeclareOption*{
    \ClassWarning{trchesh}{does not know about '\CurrentOption'}
    \PassOptionsToClass{\CurrentOption}{\@baseclass}
}
\ProcOpts

\LoadCls{\@baseclass}

\RequirePackage{verbatim}
\RequirePackage{epigraph}
\RequirePackage{multicol}

\RequirePackagePack{trtables}
\RequirePackage[shortlabels]{enumitem}
\RequirePackagePack{trgraphics}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Рубрикация. Здесь нечего менять
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{chngcntr} % tools for counters 

\let \enotesectiontype=\section

\renewcommand{\theparagraph}{\arabic{paragraph}}
% \newcommand{\paragraphheadsep}{1.4ex}
% \newcommand{\paragraphlabelformat}{\Large}
\counterwithin*{paragraph}{section}
\renewcommand{\paragraph}{
  \@startsection{paragraph}%
  {2}%
  {0em}%
  {-\baselineskip}%
  {0.5\baselineskip}%
  {\normalfont\bfseries}
}
% no need for toc
% \renewcommand*\l@paragraph{\@dottedtocline{2}{2em}{2em}}
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}

\RequirePackage{perpage}
\MakePerPage{footnote}

\RequirePackagePack{trhyplinks}
% should be overrided in layout file
% this is nice default setup
\hypersetup{%
  colorlinks=true,
  linkcolor=blue, 
  citecolor=green!50!black
}
% for proper links
\def\toclevel@paragraph{2}

\everymath{\displaystyle}
\pagenumbering{gobble}
\endinput
% vim: nofoldenable
