% Sample class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{trsample}
\RequirePackage{../src/sty/trcophand}
\decl@bool@opt{kek}

\ProcessOptions\relax
\LoadClass{article}

\flagset kek\then
\AtBeginDocument{kek \\}
\done

\endinput
