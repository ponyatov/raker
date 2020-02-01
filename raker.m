module  raker
title   legacy code raker

about   ```
        multilanguage translator system for legacy code analysis, 
        transformation and reborn to newer/other OSes, platforms, and programming language stacks
``` + ```
### supported languages

* `OCaml`           / system implementation language /
* `metaL`           / `meta`programming `L`anguage /
* GNU `Make`file
* `doxygen`
* embedded C/`C++`
* `Java`
* `C#`
* HTML/CSS/`JS`
* `PHP`
* `Delphi`

``` + ```
### targets

* Linux
* Android
* JVM
```

author  Dmitry Ponyatov <dponyatov@gmail.com>
license MIT 2020
github  https://github.com/ponyatov/raker/

file    raker.m

use make

file    raker.ml

use metaL

file    README.md = ```
# module
## title

about

(c) author license

github: github

```

file    doc/.gitignore = ```
*.pdf
*.djvu
```

file    doxy.gen patch ```
PROJECT_NAME           = ""
OUTPUT_DIRECTORY       = 
HTML_OUTPUT            = docs
INPUT                  = README.md
RECURSIVE              = YES
USE_MDFILE_AS_MAINPAGE = README.md
GENERATE_LATEX         = NO
```

