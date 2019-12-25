(defpackage :(#| TMPL_VAR name |#)-tests
  (:use :cl :cacau :assert-p :(#| TMPL_VAR name |#)))

(in-package :(#| TMPL_VAR name |#)-tests)

(deftest "foo-test" ()
  (eql-p 1 (foo 1)))
