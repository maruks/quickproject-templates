LISP ?= sbcl

build:
	$(LISP) --non-interactive --eval "(asdf:load-system :quickproject-templates)" --eval "(ql:quickload :quickproject-templates)" --eval "(asdf:make :quickproject-templates)"
