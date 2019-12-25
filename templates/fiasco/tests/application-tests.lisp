(fiasco:define-test-package :(#| TMPL_VAR name |#)-tests
  (:use :cl :fiasco :(#| TMPL_VAR name |#)))

(in-package :(#| TMPL_VAR name |#)-tests)

(deftest foo-test ()
  (is (= 1 (foo 1))))
