% Sample class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trsample}
\RequirePackage{../../src/sty/trcophand}
\def\@baseclass{article}

\DeclFlagOpt{kek,pep}
\DeclPackOpt{microtype,tikz}
\DeclPassOpt{a4paper}

\ProcOpts
\LoadCls{article}

\HasFlag{kek}{
  \AtBeginDocument{\noindent kek \\}
}
\HasFlag{pep}{
  \AtBeginDocument{\noindent pep \\}
}
\endinput
