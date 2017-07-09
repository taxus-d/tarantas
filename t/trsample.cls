% Sample class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trsample}
\RequirePackage{../src/sty/trcophand}

\DeclFlagOpt{kek,pep}
\DeclFlagOpt{tikz}


\ProcessOptions\relax
\LoadClass{article}

\HasFlag{kek}{
  \AtBeginDocument{\noindent kek \\}
}

\HasFlag{pep}{
  \AtBeginDocument{\noindent pep \\}
}
\HasFlag{tikz}{
  \RequirePackage{tikz}
}
\endinput
