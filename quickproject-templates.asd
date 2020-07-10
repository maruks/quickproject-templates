(defsystem "quickproject-templates"
  :version "0.0.1"
  :author "Maris Orbidans"
  :licence "Public Domain"
  :depends-on (:quickproject :cl-fad)
  :build-operation "program-op"
  :build-pathname "cl-new"
  :entry-point "quickproject-templates:main"
  :serial t
  :components ((:module "src"
		:serial t
		:components ((:file "quickproject-templates")))))
