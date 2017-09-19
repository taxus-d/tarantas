# flexible commands

## General ideas
We need a sensible way to describe commands that depend on layout.
I think a css-like approach is suitable for this purpose. I have already
implemented a way to parse key-value lists with arbitary separator, see `trkv.sty`
Looks like we can (in theory) parse this:

```tex
section {
font-size:\Large;
font-weight:\bfseries;
font-family:\sfseries;
font-style:\normalfont;
}

note {type:\footnote;}
```

* tags = .classes, html cant alias tags, we have this option.
* no #id's and [attributes], at least for recent future. Until we solve expandability problems
* same with cascade styles.
* proper css property values will appear when i learn them ;).
  Actually, dict lookup costs something.

## Actual syntax

### Declaration

```tex
\newflexcommand{\note}[type:\footnote;][1]{
    \flex{type}{#1}
}
```
### Call

trivial


