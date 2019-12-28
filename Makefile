LISP ?= sbcl

build:
	$(LISP) --non-interactive --eval "(ql:quickload :quickproject-templates)" --eval "(asdf:make :quickproject-templates)"
