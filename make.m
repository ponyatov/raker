file    Makefile

target  Linux

use     git ocaml

phony   all

makevar CWD = CURDIR
makevar MODULE = module # $(notdir $(CWD))

```mk
NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)
```

makevar WGET = 'wget -c --no-check-certificate'

phony: all
```mk
all: ./MODULE
    ./$^
```

phony: doxy
doxy above all
doxy: doxy.gen
    rm -rf docs ; doxygen $< 1>/dev/null

phony: ocamldoc
ocamldoc: *.ml
	mkdir -p html ; $@ -html -d html $^

```
%.ml: %.mll
	ocamllex $<
%.ml: %.mly
	ocamlyacc $<
```

file    .gitignore = [ docs/ html/ ]
