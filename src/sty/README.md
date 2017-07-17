# about this folder

Files here don't obligatory have .sty extension, though most of them have.
Consider this folder as an internal machinery section of tarantas -- wheels, spokes, springs

## General rules

* `foo.code.tex` contains most \def's and maybe some token list definitions
* `foo.sty` -- sets real behaviour using tools in aforementioned file and provides a public API of package.
  May contain actual definitions heavily using machinery from `code.tex` file
  
See `trkv.code.tex` and `trkv.sty` for (not quite perfect) example  

## Exceptions 
The rule above does not apply if package code is just too short. `trly.sty` is an example for that case.