#lang racket

(require "textures.rkt"
         ffi/unsafe
         ffi/unsafe/define)

(provide (all-defined-out))

(define-cstruct
  _Image ([data    _pointer]
          [width   _int]
          [height  _int]
          [mipmaps _int]
          [format  _int]))

(define-cstruct
  _Font ([size       _int]
         [char-count _int]
         [tex        _Texture2D]
         [rect       _pointer]
         [char-info  _pointer]))

(define-cstruct
  _CharInfo ([value     _int]
             [offset-x  _int]
             [offset-y  _int]
             [advance-x _int]
             [image     _Image]))
