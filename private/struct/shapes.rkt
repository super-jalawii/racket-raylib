#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(provide (all-defined-out))

(define-cstruct _Rect ([x _float] [y _float] [w _float] [h _float]))
