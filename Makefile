CWD    = $(CURDIR)
MODULE = $(notdir $(CWD))

NOW = $(shell date +%d%m%y)
REL = $(shell git rev-parse --short=4 HEAD)

WGET = wget -c --no-check-certificate

.PHONY: ocamldoc
ocamldoc: raker.ml m.lexer.ml m.parser.ml
	mkdir -p html ; $@ -html -d html $^

%.ml: %.mll
	ocamllex $<
%.ml: %.mly
	ocamlyacc $<

.PHONY: doxy
doxy: doxy.gen
	rm -rf docs ; doxygen $< 1>/dev/null

.PHONY: all
all: ./$(MODULE)
	./$^

.PHONY: merge release zip

MERGE  = Makefile README.md doxy.gen doc
MERGE += raker.ml m.lexer.mll m.parser.mly
MERGE += raker.m metaL.m vscode.m make.m

merge:
	git checkout master
	git checkout shadow -- $(MERGE)
	$(MAKE) doxy ocamldoc

release:
	git tag $(NOW)-$(REL)
	git push -v && git push -v --tags
	git checkout shadow

zip:
	git archive --format zip --output $(MODULE)_src_$(NOW)_$(REL).zip HEAD
