(defpackage :quickproject-templates
  (:use #:cl #:cl-fad #:quickproject)
  (:import-from #:uiop #:command-line-arguments #:call-with-fatal-condition-handler)
  (:export #:main))

(in-package #:quickproject-templates)

(defparameter *templates* (asdf/system:system-relative-pathname :quickproject-templates "templates/"))

(defparameter *default-template* "fiasco")

(defparameter *options* '(("-t" . :template)))

(defun template-directory (template-name-or-pathname)
  (if (directory-exists-p template-name-or-pathname)
      template-name-or-pathname
      (merge-pathnames-as-directory *templates* (pathname-as-directory template-name-or-pathname))))

(defun replace-first (string part replacement)
  (let ((pos (search part string :test #'char=)))
    (when pos
      (with-output-to-string (out)
	(write-string string out :end pos)
	(write-string replacement out)
	(write-string string out :start (+ pos (length part)))))))

(defun rename (p name)
  (let* ((path-name (pathname-name p))
	(renamed (replace-first path-name "application" name)))
    (when renamed
      (rename-file p (make-pathname :name renamed :defaults p)))))

(defun ->directory (p)
  (merge-pathnames p))

(defun make (name directory &key (template "fiasco"))
  (let ((dir (template-directory template)))
    (if (directory-exists-p dir)
	(progn
	  (make-project directory :name name :template-directory dir)
	  (walk-directory directory (lambda (p) (rename p name))))
	(format t "template ~s not found~%" (namestring dir)))))

(defun parse-args (args &optional option arg-list result)
  (if args
      (let ((arg (car args)))
	(if option
	    (parse-args (cdr args) nil arg-list (acons (cdr option) arg result))
	    (let ((opt (assoc arg *options* :test #'string=)))
	      (parse-args (cdr args) opt (if opt arg-list (cons arg arg-list)) result))))
      (let* ((arglist (nreverse arg-list))
	    (name (car arglist))
	    (directory (cadr arglist)))
	(acons :directory directory (acons :name name result)))))

(defun run ()
  (let* ((args (command-line-arguments))
	 (opts (parse-args args))
	 (name (cdr (assoc :name opts)))
	 (dir (cdr (assoc :directory opts)))
	 (template (cdr (assoc :template opts))))
    (if name
	(let* ((directory (->directory (or dir name))))
	  (if (directory-exists-p directory)
	      (format t "directory ~s exists~%" (namestring directory))
	      (make name directory :template (or template *default-template*))))
	(format t "usage: cl-new <name> [<directory>] [-t <template>]~%"))))

(defun main ()
  (call-with-fatal-condition-handler #'run))
