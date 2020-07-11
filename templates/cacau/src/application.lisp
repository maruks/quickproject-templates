(defpackage #:(#| TMPL_VAR name |#)
  (:use #:cl)
  (:export #:foo))

(in-package #:(#| TMPL_VAR name |#))

(defun foo (x)
  x)
