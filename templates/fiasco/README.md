# (#| TMPL_VAR name |#)

### Test

    sbcl --non-interactive --eval "(ql:quickload :(#| TMPL_VAR name |#)/tests)" --eval "(asdf:test-system :(#| TMPL_VAR name |#))"
