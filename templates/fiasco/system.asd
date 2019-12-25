;;;; (#| TMPL_VAR name |#).asd(#| TMPL_IF copyright |#)
;;
;;;; (#| TMPL_VAR copyright |#)(#| /TMPL_IF |#)

(defsystem "(#| TMPL_VAR name |#)"
  :description "Describe (#| TMPL_VAR name |#) here"
  :author "(#| TMPL_VAR author |#)"
  :license "(#| TMPL_VAR license |#)"
  :version "0.0.1"
  :serial t(#| TMPL_IF depends-on |#)
  :depends-on (#| TMPL_VAR dependencies-string |#)(#| /TMPL_IF |#)
  :components ((:module "src"
		:components ((:file "(#| TMPL_VAR name |#)"))))
  :in-order-to ((test-op (test-op "(#| TMPL_VAR name |#)/tests"))))

(defsystem "(#| TMPL_VAR name |#)/tests"
  :license "(#| TMPL_VAR license |#)"
  :depends-on (:(#| TMPL_VAR name |#)
	       :fiasco)
  :serial t
  :components ((:module "tests"
		:components ((:file "(#| TMPL_VAR name |#)-tests"))))
  :perform (test-op (o c) (symbol-call 'fiasco 'all-tests)))
